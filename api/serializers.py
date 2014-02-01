from api.models import *
from rest_framework import serializers

class UserFriendsSerializer( serializers.ModelSerializer ):
    class Meta:
        model = UserFriends
        fields = ( "user", )

class UserSerializer( serializers.ModelSerializer ):
    friends = serializers.RelatedField( many = True )
    class Meta:
        model = User
        fields = ( "id", "firstname", "surname", "age", "gender", "friends" )