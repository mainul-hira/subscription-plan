from rest_framework import serializers, status, permissions
from rest_framework import viewsets
from rest_framework.response import Response
from django.contrib.auth.models import User
from rest_framework.views import APIView
from datetime import datetime, timedelta
from .models import Plan
from .serializers import PlanSerializer
from rest_framework.pagination import LimitOffsetPagination
from django.contrib.auth import get_user_model

User = get_user_model()


class PlanViewSet(viewsets.ModelViewSet):
    queryset = Plan.objects.all()
    serializer_class = PlanSerializer 
    permission_classes = (permissions.IsAdminUser,)
    pagination_class = LimitOffsetPagination


