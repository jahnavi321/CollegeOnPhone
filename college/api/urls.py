from django.urls import include, path
from . import views
urlpatterns = [
    path('users/', include('cop.urls')),
    path('rest-auth/', include('rest_auth.urls')),
    path('rest-auth/registration/', include('rest_auth.registration.urls')),
]