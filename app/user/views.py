"""
Views for the user API
"""
from rest_framework import generics

from user.serializers import UserSerialized

class CreateUserView(generics.CreateAPIView):
    """Create a new User in the system"""
    serializer_class = UserSerialized
