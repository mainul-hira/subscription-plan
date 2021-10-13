from .views import *
from django.urls import path
from rest_framework import routers

from django.conf.urls import include

router = routers.DefaultRouter()

router.register(r'plans', PlanViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('purchase-plan/', PurchasePlanView.as_view(), name="purchase-plan"),
]
