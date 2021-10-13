from django.db import models
from users.models import CustomerPhone
from django.conf import settings



class Plan(models.Model):
    name = models.CharField(max_length=100)
    amount = models.DecimalField(max_digits=9, decimal_places=2)
    payment_cycle = models.IntegerField(default=30)
    durantion = models.IntegerField(default=360)
    is_cancellable = models.BooleanField(default=False)

    def __str__(self) -> str:
        return self.name


class CustomerPlan(models.Model):
    start_date = models.DateField()
    end_date = models.DateField()
    amount = models.DecimalField(max_digits=9, decimal_places=2)
    is_active = models.BooleanField(default=True)
    customer = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='customer_plans', null=True, blank=True, on_delete=models.CASCADE)
    plan = models.ForeignKey(Plan, related_name='customer_plans', null=True, blank=True, on_delete=models.CASCADE)


