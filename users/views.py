import random

from rest_framework import status, permissions
from rest_framework import generics
from rest_framework.response import Response
from django.contrib.auth.models import User
from rest_framework.views import APIView
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from users.serializers import UserSerializer, OTPSerializer, PohnoeNumberSerializer
from users.models import CustomerPhone, OTPToken
from datetime import datetime, timedelta
from django.contrib.auth import get_user_model

User = get_user_model()



"""
    Views for Custom Token
"""

class CustomTokenPairSerializer(TokenObtainPairSerializer):
    @classmethod
    def get_token(cls, user):
        token = super(CustomTokenPairSerializer, cls).get_token(user)
        return token



class GetCustomToken(APIView):
    permission_classes = (permissions.AllowAny,)
    serializer_class = CustomTokenPairSerializer

    def post(self, request):
        tokens = CustomTokenPairSerializer(request.data).validate(request.data)
        if User.objects.filter(phone=request.data['phone'], is_superuser=True).exists():
            return Response({"token": tokens}, status=status.HTTP_201_CREATED)
        elif CustomerPhone.objects.filter(phone_no=request.data['phone'], verified=True).exists():
            return Response({"token": tokens}, status=status.HTTP_201_CREATED)
        else:
            return Response({"message": "Please verify your phone no first"}, status=status.HTTP_400_BAD_REQUEST)


def generate_otp(customer_phone):
    otp = ''.join(random.choice('0123456789') for i in range(6))
    OTPToken(customer_phone=customer_phone, otp=otp).save()
    return otp



class RegisterView(generics.CreateAPIView):
    model = User
    serializer_class = UserSerializer
    permission_classes = (permissions.AllowAny,)

    def post(self, request):
        serializer = UserSerializer(data=request.data)
        
        if serializer.is_valid():
            user = serializer.save()
            customer_phone = CustomerPhone(customer=user, phone_no=request.data['phone'])
            customer_phone.save()
            # For testing purpose OTP is printed in Terminal so that we can easily verify Customer
            print("OTP")
            print(generate_otp(customer_phone))
            return Response({"message":"Registartion Successful"}, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors)



class VerifyOTPView(APIView):
    permission_classes = (permissions.AllowAny,)

    def post(self, request):
        serializer = OTPSerializer(data=request.data)
        
        # Choose 5min por for otp verfication
        time_check = datetime.now() - timedelta(minutes=5)
        if serializer.is_valid():
            otp_token = OTPToken.objects.filter(customer_phone__phone_no=request.data['phone'], otp=request.data['otp'], used=False, generated_at__gte=time_check).last()
            if otp_token:
                otp_token.customer_phone.verified = True
                otp_token.customer_phone.save()
            
                otp_token.used = True
                otp_token.save()
                return Response({"message":"Verification Successful"}, status=status.HTTP_200_OK)
            return Response({"message":"sorry, your token is not valid or 5 minutes have passed from token request"}, status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response(serializer.errors)



class AddPhoneNoView(generics.CreateAPIView):
    permission_classes = (permissions.IsAuthenticated,)

    def post(self, request):
        serializer = PohnoeNumberSerializer(data=request.data)
        
        if serializer.is_valid():
            if CustomerPhone.objects.filter(phone_no=request.data['phone'], verified=True).exists():
                return Response({"message":"Phone no is already exists in the system"}, status=status.HTTP_400_BAD_REQUEST)

            obj, created = CustomerPhone.objects.get_or_create(customer=request.user, phone_no=request.data['phone'])
            print("OTP")
            print(generate_otp(obj))
            return Response({"message":"Phone No added Successfully, Please verify it via otp"}, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors)



class MakePrimaryPhoneView(generics.CreateAPIView):
    permission_classes = (permissions.IsAuthenticated,)

    def post(self, request):
        serializer = PohnoeNumberSerializer(data=request.data)
        
        if serializer.is_valid():
            customer_phone = CustomerPhone.objects.filter(customer=request.user, phone_no=request.data['phone'], verified=True).last()
            if customer_phone:
                user = User.objects.get(pk=request.user.pk)
                user.phone = request.data['phone']
                user.save()
                return Response({"message":f"Now {request.data['phone']} is your primary phone no"}, status=status.HTTP_202_ACCEPTED)
            return Response({"message":"Phone no is not verified yet or not in our system"}, status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response(serializer.errors)