from api.models import User
from api.serializers import UserSerializer
from api.social_graph import SocialGraphFactory
from rest_framework import viewsets
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import authentication, permissions

class UserViewSet( viewsets.ModelViewSet ):
    """
    API endpoint that allows users to be viewed.
    """
    authentication_classes = ( authentication.BasicAuthentication, )
    permission_classes = ( permissions.IsAuthenticated, )
    queryset = User.objects.all()
    serializer_class = UserSerializer

class AbstractFriendsListView( APIView ):
    """
    API action that handles requests to get different types of user friends.
    """
    authentication_classes = ( authentication.BasicAuthentication, )
    permission_classes = ( permissions.IsAuthenticated, )
    
    def get( self, request, user_id, method, format = None ):
        """
        The method that handles GET requests to current API action and returns
        the list of friends direct|friends of|suggested friends.
        """
        
        return Response( SocialGraphFactory.build_user_friends( "retrieve", method, user_id ) )