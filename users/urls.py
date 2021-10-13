from django.urls import path
from . import views
from rest_framework_simplejwt.views import TokenRefreshView

urlpatterns = [
    path('token/', views.GetCustomToken.as_view(), name='customtoken'),
    path('refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('register/', views.RegisterView.as_view(), name='register'),
    path('verify-otp/', views.VerifyOTPView.as_view(), name='verify-otp'),
    path('add-phone-no/', views.AddPhoneNoView.as_view(), name='add-phone-no'),
    path('make-primary-phone/', views.MakePrimaryPhoneView.as_view(), name='make-primary-phone'),

]