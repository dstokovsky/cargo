from django.conf.urls import patterns, include, url
from rest_framework import routers
from api import views

router = routers.DefaultRouter()
router.register( r'users', views.UserViewSet )

urlpatterns = patterns('',
    url( r'^', include( router.urls ) ),
    url( r'^users/(?P<user_id>[0-9]+)/friends/(?P<method>(direct|friends|suggested))/$', 
        views.AbstractFriendsListView.as_view() ),
)
