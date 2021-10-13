from rest_framework import serializers
from django.contrib.auth import get_user_model
from .models import Plan

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
        fields = ('name', 'amount', 'payment_cycle', 'total_valid_months', 'is_cancellable')

