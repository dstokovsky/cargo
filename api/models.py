from django.db import models

class User( models.Model ):
    firstname = models.CharField( max_length = 30, blank = True )
    surname = models.CharField( max_length = 50, blank = True )
    age = models.IntegerField( blank = True )
    gender = models.CharField( max_length = 10, blank = True )
    created_at = models.DateTimeField( auto_now_add = True )
    updated_at = models.DateTimeField( auto_now = True )
    
    class Meta:
        db_table = "user"
    
    def __unicode__(self):
        return '%d' % self.id

class UserFriends( models.Model ):
    user = models.ForeignKey( User, related_name = "users" )
    friend = models.ForeignKey( User, related_name = "friends" )
    
    class Meta:
        db_table = "user_friends"
        unique_together = ( ( "user", "friend" ), )
    
    def __unicode__(self):
        return '%d' % self.user_id