from rest_framework import status, permissions
from rest_framework import viewsets, generics
from rest_framework.response import Response
from datetime import date, timedelta
from .models import CustomerPlan, Plan
from .serializers import PlanSerializer, PurchasePlanSerializer
from rest_framework.pagination import LimitOffsetPagination
from django.contrib.auth import get_user_model
from .tasks import deduct_money

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
        
        if serializer.is_valid():
            if CustomerPlan.objects.filter(is_active=True, customer_id=request.user.pk).exists():
                return Response({"message":"You cna't purchase another plan because you already have an active plan"}, status=status.HTTP_406_NOT_ACCEPTABLE)
            plan = Plan.objects.get(pk=request.data['plan'])
            end_date = date.today() + timedelta(days=plan.total_valid_months*plan.payment_cycle)
            CustomerPlan(start_date=date.today(), end_date=end_date, customer=request.user, plan=plan, amount=plan.amount).save()
            deduct_money(request.user.phone, plan.amount, True)
            data = PlanSerializer(plan).data
            return Response({"message":"Purchase Plan Successfull", "data":data}, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors)

