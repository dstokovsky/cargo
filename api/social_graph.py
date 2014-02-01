from api.models import User
from api.serializers import UserSerializer
from collections import Counter

class AbstractGraph( object ):
    """
    The root class and the some kind of interface for different types of graph
    """
    
    @staticmethod
    def retrieve( user_id ):
        """
        Should be overriden in childs
        """
        raise Exception( "AbstractGraph::retrieve is not implemented" )

class DirectFriendsGraph( AbstractGraph ):
    """
    Implementation of graph that handles different requests related to the direct
    friends entity for specified user.
    """
    
    @staticmethod
    def retrieve( user_id ):
        """
        Retrieves the direct friends for specified user
        """
        user = User.objects.get( pk = user_id )
        return UserSerializer( user ).data[ "friends" ]

class FriendsOfFriendsGraph( AbstractGraph ):
    """
    Implementation of graph that handles different requests related to the friends
    of friends entity for specified user.
    """
    
    @staticmethod
    def retrieve( user_id ):
        """
        Retrieves the friends of friends for specified user
        """
        direct_friends = SocialGraphFactory.build_user_friends( "retrieve", "direct", user_id )
        friends_of_friends = []
        for friend_id in direct_friends:
            user_friend = User.objects.get( pk = friend_id )
            serializer_friends = UserSerializer( user_friend )
            friends_of_friends.append( { friend_id: serializer_friends.data[ "friends" ] } )
        
        return friends_of_friends

class SuggestedFriendsGraph( AbstractGraph ):
    """
    Implementation of graph that handles different requests related to the suggested
    friends entity for specified user.
    """
    
    @staticmethod
    def retrieve( user_id ):
        """
        Retrieves the suggested friends for specified user
        """
        direct_friends = SocialGraphFactory.build_user_friends( "retrieve", "direct", user_id )
        
        possible_friends = []
        for friend_id in direct_friends:
            possible_friends += SocialGraphFactory.build_user_friends( "retrieve", "direct", friend_id )
        
        suggested_friends = [ friend_id for friend_id, counter in Counter( possible_friends ).iteritems() 
            if counter >= 2 and friend_id != user_id and not friend_id in direct_friends ]    
        suggested_friends.sort()
        
        return suggested_friends

class SocialGraphFactory( object ):
    """
    The social graph factory that depending on input parameters calls necessary 
    method of chosen action and get data for specified user.
    """
    
    @staticmethod
    def build_user_friends( method, action, user_id ):
        """
        Builds the user friends data according to request.
        """
        if method == "retrieve":
            if action == "direct":
                return DirectFriendsGraph.retrieve( user_id )
            elif action == "friends":
                return FriendsOfFriendsGraph.retrieve( user_id )
            elif action == "suggested":
                return SuggestedFriendsGraph.retrieve( user_id )
            else:
                raise Exception( "{0}:{1}:{2} - not implemented here".format( action, method, "friends" ) )
        else:
            raise Exception( "'{0}' method does not implemented here".format( method ) )