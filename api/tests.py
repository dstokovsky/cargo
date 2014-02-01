from django.test import TestCase
from api.models import User, UserFriends
from rest_framework.test import APIClient, APITestCase
from rest_framework import status
from django.contrib.auth.models import User as AuthUser

class UserTestCase( TestCase ):
    """
    Tests api application User model
    """
    
    def setUp( self ):
        User.objects.create( firstname = "Denis", surname = "Stokovsky", age = 28, gender = "male" )
        User.objects.create( firstname = "Vasya", surname = "Pupkin", age = 21, gender = "male" )
        User.objects.create( firstname = "Buffy", surname = "Summers", age = 22, gender = "female" )

    def test_user_denis( self ):
        user = User.objects.get( firstname = "Denis" )
        self.assertTrue( isinstance( user, User ), "User with name Denis does not exist" )
        self.assertEqual( user.surname, "Stokovsky", "Invalid surname for user Denis" )

    def test_user_vasya( self ):
        user = User.objects.get( firstname = "Vasya" )
        self.assertTrue( isinstance( user, User ), "User with name Vasya does not exist" )
        self.assertNotEqual( user.age, 28, "Invalid age value for user Vasya" )
        self.assertEqual( user.age, 21, "Invalid age value for user Vasya" )
        
    def test_user_buffy( self ):
        user = User.objects.get( firstname = "Buffy" )
        self.assertTrue( isinstance( user, User ), "User with name Buffy does not exist" )
        self.assertNotEqual( user.surname, "Stokovsky", "Invalid surname for user Buffy" )
        self.assertTrue( user.gender == "female", "Invalid gender valuefor user Buffy" )

class UserFriendsTestCase( TestCase ):
    """
    Tests api application UserFriends model
    """
    
    def setUp( self ):
        denis = User.objects.create( firstname = "Denis", surname = "Stokovsky", age = 28, gender = "male" )
        vasya = User.objects.create( firstname = "Vasya", surname = "Pupkin", age = 21, gender = "male" )
        buffy = User.objects.create( firstname = "Buffy", surname = "Summers", age = 22, gender = "female" )
        UserFriends.objects.create( user = denis, friend = vasya )
        UserFriends.objects.create( user = denis, friend = buffy )
        UserFriends.objects.create( user = buffy, friend = denis )
        UserFriends.objects.create( user = vasya, friend = denis )
    
    def test_user_friends_of_denis( self ):
        denis = User.objects.get( firstname = "Denis" )
        vasya = User.objects.get( firstname = "Vasya" )
        buffy = User.objects.get( firstname = "Buffy" )
        is_vasya_denis_friend = is_buffy_denis_friend = False
        for friend in denis.friends.all():
            if not is_vasya_denis_friend:
                is_vasya_denis_friend = ( vasya.id == friend.user_id )
            if not is_buffy_denis_friend:
                is_buffy_denis_friend = ( buffy.id == friend.user_id )
        self.assertTrue( is_vasya_denis_friend, "Vasya is not in Denis's friends list" )
        self.assertTrue( is_buffy_denis_friend, "Buffy is not in Denis's friends list" )
    
    def test_user_friends_of_vasya( self ):
        vasya = User.objects.get( firstname = "Vasya" )
        denis = User.objects.get( firstname = "Denis" )
        is_denis_vasya_friend = False
        for friend in vasya.friends.all():
            if not is_denis_vasya_friend:
                is_denis_vasya_friend = ( denis.id == friend.user_id )
        self.assertTrue( is_denis_vasya_friend, "Denis is not in Vasya's friends list" )
    
    def test_user_friends_of_buffy( self ):
        buffy = User.objects.get( firstname = "Buffy" )
        denis = User.objects.get( firstname = "Denis" )
        is_denis_buffy_friend = False
        for friend in buffy.friends.all():
            if not is_denis_buffy_friend:
                is_denis_buffy_friend = ( denis.id == friend.user_id )
        self.assertTrue( is_denis_buffy_friend, "Denis is not in Buffy's friends list" )

class UsersApiTestCase( APITestCase ):
    """
    Tests users list output via api
    """
    
    def setUp( self ):
        self.client = APIClient()
        user = AuthUser.objects.create_user( username = "admin", password = "admin" )
        self.client.force_authenticate( user = user )
        User.objects.create( firstname = "Denis", surname = "Stokovsky", age = 28, gender = "male" )
        User.objects.create( firstname = "Vasya", surname = "Pupkin", age = 21, gender = "male" )
        User.objects.create( firstname = "Buffy", surname = "Summers", age = 22, gender = "female" )
    
    def test_users_list( self ):
        response = self.client.get( "/users/" )
        self.assertEqual( response.status_code, status.HTTP_200_OK )
        database_number_of_users = len( User.objects.all() )
        self.assertEqual( response.data[ "count" ], database_number_of_users, "Invalid number of users" )
        self.assertEqual( len( response.data[ "results" ] ), database_number_of_users, "Invalid number of users" )

class FriendsApiTestCase( APITestCase ):
    """
    Tests social graph api actions
    """
    
    def setUp( self ):
        self.client = APIClient()
        user = AuthUser.objects.create_user( username = "admin", password = "admin" )
        self.client.force_authenticate( user = user )
        denis = User.objects.create( firstname = "Denis", surname = "Stokovsky", age = 28, gender = "male" )
        vasya = User.objects.create( firstname = "Vasya", surname = "Pupkin", age = 21, gender = "male" )
        buffy = User.objects.create( firstname = "Buffy", surname = "Summers", age = 22, gender = "female" )
        scarlett = User.objects.create( firstname = "Scarlett", surname = "Johansson", age = 29, gender = "female" )
        UserFriends.objects.create( user = denis, friend = vasya )
        UserFriends.objects.create( user = denis, friend = buffy )
        UserFriends.objects.create( user = buffy, friend = denis )
        UserFriends.objects.create( user = vasya, friend = denis )
        UserFriends.objects.create( user = vasya, friend = scarlett )
        UserFriends.objects.create( user = buffy, friend = scarlett )
        UserFriends.objects.create( user = scarlett, friend = vasya )
        UserFriends.objects.create( user = scarlett, friend = buffy )

    def test_users_direct_friends( self ):
        denis = User.objects.get( firstname = "Denis" )
        vasya = User.objects.get( firstname = "Vasya" )
        buffy = User.objects.get( firstname = "Buffy" )
        response = self.client.get( "/users/%d/friends/direct/" % denis.id )
        self.assertEqual( response.status_code, status.HTTP_200_OK )
        self.assertTrue( len( response.data ) > 0, "Denis has no friends" )
        self.assertTrue( str( vasya.id ) in response.data, "Invalid Denis's list of friends" )
        self.assertTrue( str( buffy.id ) in response.data, "Invalid Denis's list of friends" )
    
    def test_users_friends_of_friends( self ):
        denis = User.objects.get( firstname = "Denis" )
        vasya = User.objects.get( firstname = "Vasya" )
        buffy = User.objects.get( firstname = "Buffy" )
        response = self.client.get( "/users/%d/friends/friends/" % vasya.id )
        self.assertEqual( response.status_code, status.HTTP_200_OK )
        self.assertTrue( len( response.data ) > 0, "Invalid friends of friends list for user Vasya" )
        
        for friends in response.data:
            if not friends.get( str( denis.id ), None ) is None:
                self.assertEqual( len( friends.get( str( denis.id ), None ) ), len( denis.friends.all() ), "Denis has two friends" )
            if not friends.get( str( buffy.id ), None ) is None:
                self.assertEqual( len( friends.get( str( buffy.id ), None ) ), len( buffy.friends.all() ), "Buffy has one friend" )
    
    def test_users_suggested_friend( self ):
        denis = User.objects.get( firstname = "Denis" )
        vasya = User.objects.get( firstname = "Vasya" )
        buffy = User.objects.get( firstname = "Buffy" )
        scarlett = User.objects.get( firstname = "Scarlett" )
        response = self.client.get( "/users/%d/friends/suggested/" % denis.id )
        self.assertEqual( response.status_code, status.HTTP_200_OK )
        self.assertTrue( str( scarlett.id ) in response.data, "Scarlett is in suggested friends for Denis" )