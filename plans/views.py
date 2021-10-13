from rest_framework import status, permissions
from rest_framework import viewsets, generics
from rest_framework.response import Response
from datetime import date, timedelta
from .models import CustomerPlan, Plan
from .serializers import PlanSerializer, PurchasePlanDetailsSerializer, PurchasePlanSerializer
from rest_framework.pagination import LimitOffsetPagination
from django.contrib.auth import get_user_model
from .tasks import deduct_money
from django_q.tasks import async_task

User = get_user_model()


class PlanViewSet(viewsets.ModelViewSet):
    queryset = Plan.objects.all()
    serializer_class = PlanSerializer
    pagination_class = LimitOffsetPagination

    def get_permissions(self):
        if self.action in ('list', 'retrieve'):
            self.permission_classes = (permissions.IsAuthenticated,)
        else:
            self.permission_classes = (permissions.IsAdminUser,)
        return super(PlanViewSet, self).get_permissions()



class PurchasePlanView(generics.CreateAPIView):
    permission_classes = (permissions.IsAuthenticated,)

    def post(self, request):
        serializer = PurchasePlanSerializer(data=request.data)
        try:
            if serializer.is_valid():
                if CustomerPlan.objects.filter(is_active=True, customer_id=request.user.pk).exists():
                    return Response({"message":"You can't purchase another plan because you already have an active plan"}, status=status.HTTP_406_NOT_ACCEPTABLE)
                plan = Plan.objects.get(pk=request.data['plan'])
                end_date = date.today() + timedelta(days=plan.total_valid_months*plan.payment_cycle)
                customer_plan = CustomerPlan(start_date=date.today(), end_date=end_date, customer=request.user, plan=plan, amount=plan.amount)
                customer_plan.save()
                deduct_money(request.user.phone, plan.amount)
                async_task('plans.tasks.deduct_money', request.user.phone, plan.amount)

                data = PurchasePlanDetailsSerializer(customer_plan).data
                return Response({"message":"Purchase Plan Successful", "data":data}, status=status.HTTP_201_CREATED)
            else:
                return Response(serializer.errors)
        except Exception as e:
            print(e)
            return Response({"message":"An error occurred"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


class CancelPlanView(generics.UpdateAPIView):
    permission_classes = (permissions.IsAuthenticated,)

    def put(self, request, pk):
        try:
            customer_plan = CustomerPlan.objects.filter(pk=pk, is_active=True, customer_id=request.user.pk)\
                .select_related('plan').last()
            if not customer_plan:
                return Response({"message":"Sorry it's not an active plan or not a valid plan"}, status=status.HTTP_400_BAD_REQUEST)
            data = PurchasePlanDetailsSerializer(customer_plan).data
            if Plan.objects.get(pk=customer_plan.plan_id).is_cancellable:
                customer_plan.is_active = False
                customer_plan.save()
                data = PurchasePlanDetailsSerializer(customer_plan).data
                return Response({"message":"Plan cancelled Successfully", "data":data}, status=status.HTTP_206_PARTIAL_CONTENT)
            return Response({"message":"Plan is not cancellable", "data":data}, status=status.HTTP_406_NOT_ACCEPTABLE)
        except Exception as e:
            print(e)
            return Response({"message":"An error occurred"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)