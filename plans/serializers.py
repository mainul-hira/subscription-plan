from rest_framework import serializers
from django.contrib.auth import get_user_model
from .models import CustomerPlan, Plan

User = get_user_model()

class PlanSerializer(serializers.ModelSerializer):
    def validate(self, data):
        if data['amount']<=0:
            raise serializers.ValidationError({"amount":"Amount must be greater than 0"})
        if data.get('payment_cycle') and data['payment_cycle']<=0:
            raise serializers.ValidationError({"payment_cycle":"Pyament cycle value must be greater than 0"})
        if data.get('total_valid_months') and data['total_valid_months']<=0:
            raise serializers.ValidationError({"payment_cycle":"Total valid months value must be greater than 0"})
        return data

    class Meta:
        model = Plan
        fields = ('id', 'name', 'amount', 'payment_cycle', 'total_valid_months', 'is_cancellable')
        read_onle_fields = ('id',)


class PurchasePlanSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomerPlan
        fields = ('plan',)



class PurchasePlanDetailsSerializer(serializers.ModelSerializer):
    plan_name = serializers.SerializerMethodField()
    plan_amount = serializers.SerializerMethodField()
    plan_months_validity = serializers.SerializerMethodField()
    plan_payment_cycle = serializers.SerializerMethodField()
    plan_cancellable = serializers.SerializerMethodField()

    def get_plan_name(self, obj):
        return obj.plan.name
    
    def get_plan_amount(self, obj):
        return obj.plan.amount

    def get_plan_months_validity(self, obj):
        return obj.plan.total_valid_months

    def get_plan_payment_cycle(self, obj):
        return obj.plan.payment_cycle
    
    def get_plan_cancellable(self, obj):
        return obj.plan.is_cancellable
    
    class Meta:
        model = CustomerPlan
        fields = (
            'id', 'plan_id', 'start_date', 'end_date', 'is_active', 'plan_name',
            'plan_amount', 'plan_months_validity', 'plan_payment_cycle', 'plan_cancellable'
        )



