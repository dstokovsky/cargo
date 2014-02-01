from django.conf.urls import patterns, include, url
from rest_framework import routers
from api import views

router = routers.DefaultRouter()
router.register(r'users', views.UserViewSet)

urlpatterns = patterns('',
    url(r'^', include(router.urls)),
    url(r'^users/(?P<user_id>[0-9]+)/friends/direct/$', views.UserDirectFriendsList.as_view()),
    url(r'^users/(?P<user_id>[0-9]+)/friends/suggested/$', views.UserSuggestedFriendsList.as_view()),
    url(r'^users/(?P<user_id>[0-9]+)/friends/friends/$', views.UserFriendsFriendsList.as_view()),
)
