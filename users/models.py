from django.db import models
from django.conf import settings


from django.contrib.auth.models import AbstractUser, BaseUserManager
from django.db import models
from django.utils.translation import ugettext_lazy as _


class CustomUserManager(BaseUserManager):
    """Define a model manager for User model with no username field."""

    use_in_migrations = True

    def _create_user(self, phone, password, **extra_fields):
        """Create and save a User with the given phone and password."""
        if not phone:
            raise ValueError('The given phone must be set')
        self.phone = phone
        user = self.model(phone=phone, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_user(self, phone, password=None, **extra_fields):
        """Create and save a regular User with the given phone and password."""
        extra_fields.setdefault('is_staff', False)
        extra_fields.setdefault('is_superuser', False)
        return self._create_user(phone, password, **extra_fields)

    def create_superuser(self, phone, password, **extra_fields):
        """Create and save a SuperUser with the given phone and password."""
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)

        if extra_fields.get('is_staff') is not True:
            raise ValueError('Superuser must have is_staff=True.')
        if extra_fields.get('is_superuser') is not True:
            raise ValueError('Superuser must have is_superuser=True.')

        return self._create_user(phone, password, **extra_fields)

class CustomUser(AbstractUser):
    """User model."""

    username = None
    email = models.EmailField(blank=True, null=True)
    phone = models.CharField(_('phone number'), max_length=11, unique=True)
    

    USERNAME_FIELD = 'phone'
    REQUIRED_FIELDS = []
    
    objects = CustomUserManager()



class CustomerPhone(models.Model):
    customer = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='customer_phones', null=True, blank=True, on_delete=models.CASCADE)
    phone_no = models.CharField(max_length=11)
    verified = models.BooleanField(default=False)


class OTPToken(models.Model):
    otp = models.PositiveIntegerField()
    generated_at = models.DateTimeField(auto_now=True)
    used = models.BooleanField(default=False)
    customer_phone = models.ForeignKey(CustomerPhone, related_name='otps', null=True, blank=True, on_delete=models.CASCADE)
