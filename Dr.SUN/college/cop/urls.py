# users/urls.py
from django.urls import include, path, re_path

from . import views

urlpatterns = [
    path('users/', views.UserListView.as_view()),
    path('admin/', views.AdminListView.as_view()),

    #for login (linked with master database)
    path('app/login/(?P<token_id>[\w\!-@+]+/)',views.app_login,name="app_login"),

    #url path for get requests
    path('admin/1', views.get_admin_list , name="get_admin_list"),
    path('department/', views.get_department, name="get_department"),
    path('faculty/', views.get_faculty, name="get_faculty"),
    path('course/', views.get_course , name="get_course"),
    path('student/', views.get_student, name="get_student"),
    path('s_c_mapper/', views.get_s_c_mapper, name="get_s_c_mapper"),
    path('day_parts/', views.get_day_parts, name="get_day_parts"),
    path('grades/', views.get_grades, name="get_grades"),
    path('events/', views.get_events, name="get_events"),
    path('assignments/', views.get_assignments, name="get_assignments"),
    path('timetable/', views.get_timetable, name="get_timetable"),
    path('classreschedules/', views.get_classreschedules, name="get_classreschedules"),
    path('preclassreq/', views.get_preclassreq, name="get_preclassreq"),
    path('favourites/', views.get_favourites, name="get_favourites"),


    path('rest-auth/', include('rest_auth.urls')),

    #url paths for post request
    path('post_check/', views.post_data , name="post_data"),
    path('post_favourites/', views.post_favourites , name="post_favourites"),
    path('post_events/', views.post_events , name="post_events"),
    path('post_classreschedules/', views.post_classreschedules , name="post_classreschedules"),
    path('post_preclassreq/', views.post_preclassreq , name="post_preclassreq"),
    path('post_assignments/', views.post_assignments , name="post_assignments"),


    path('rest-auth/registration/', include('rest_auth.registration.urls')),

    #path('admin/', views.get_rest_list),
    #path('admin/1',
     #   views.AdminListView.as_view()),
]