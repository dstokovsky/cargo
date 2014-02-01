from api.models import User
from api.serializers import UserSerializer
from rest_framework import viewsets
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import authentication, permissions

class UserViewSet( viewsets.ModelViewSet ):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = User.objects.all()
    serializer_class = UserSerializer

class AbstractFriendsListView( APIView ):
    authentication_classes = ( authentication.SessionAuthentication, 
        authentication.BasicAuthentication )
    permission_classes = ( permissions.IsAuthenticated, )

class UserDirectFriendsList( AbstractFriendsListView ):
    
    def get(self, request, user_id, format=None):
        """
        Return a list of all users.
        """
        user = User.objects.get( pk = user_id )
        direct_friends = UserSerializer( user ).data[ "friends" ]
        
        return Response( direct_friends )

class UserSuggestedFriendsList( AbstractFriendsListView ):
    
    def get(self, request, user_id, format=None):
        """
        Return a list of all users.
        """
        user = User.objects.get( pk = user_id )
        serializer = UserSerializer( user )
        
        return Response( serializer.data )
    
class UserFriendsFriendsList( AbstractFriendsListView ):
    
    def get(self, request, user_id, format=None):
        """
        Return a list of all users.
        """
        user = User.objects.get( pk = user_id )
        serializer = UserSerializer( user )
        friends_of_friends = []
        for friend in serializer.data[ "friends" ]:
            user_friend = User.objects.get( pk = friend )
            serializer_friends = UserSerializer( user_friend )
            friends_of_friends.append( { friend: serializer_friends.data[ "friends" ] } )
            
        return Response( friends_of_friends )