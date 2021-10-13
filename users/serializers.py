from rest_framework import serializers
from django.contrib.auth import get_user_model

User = get_user_model()

class UserSerializer(serializers.ModelSerializer):
    name = serializers.CharField(source='first_name')

    def validate(self, data):
        """check that the phone no is valid or not"""
        if not data['phone'].isnumeric() or not data['phone'].startswith("01") or len(data['phone'])!=11:
            raise serializers.ValidationError({"phone":"Phone number is not valid"})
        return data

    class Meta:
        model = User
        fields = ('name', 'phone', 'password')

    def create(self, validated_data):
        user = super(UserSerializer, self).create(validated_data)
        user.set_password(validated_data['password'])
        user.save()
        return user


class UserMinSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('name', 'phone')



class PohnoeNumberSerializer(serializers.Serializer):
    
    def validate(self, data):
        """check that the phone no is valid or not"""
        if not data['phone'].isnumeric() or not data['phone'].startswith("01") or len(data['phone'])!=11:
            raise serializers.ValidationError({"phone":"Phone number is not valid"})
        return data

    phone = serializers.CharField(max_length=11, required=True)



class OTPSerializer(PohnoeNumberSerializer):
    otp = serializers.IntegerField(required=True)