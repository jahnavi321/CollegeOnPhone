# users/admin.py
from django.contrib import admin
from django.contrib.auth import get_user_model
from django.contrib.auth.admin import UserAdmin

from .forms import CustomUserCreationForm, CustomUserChangeForm
from .models import feeschedules,favourites,classreschedules,preclassreq,timetable,assignments,events,grades,day_parts,s_c_mapper,student,department,course,faculty ,Admin,CustomUser


class CustomUserAdmin(UserAdmin):
    add_form = CustomUserCreationForm
    form = CustomUserChangeForm
    model = CustomUser
    list_display = ['email', 'username', 'name']

admin.site.register(CustomUser)#, CustomUserAdmin)
admin.site.register(Admin)
admin.site.register(faculty)
admin.site.register(course)
admin.site.register(department)
admin.site.register(student)
admin.site.register(s_c_mapper)
admin.site.register(day_parts)
admin.site.register(grades)
admin.site.register(events)
admin.site.register(assignments)
admin.site.register(timetable)
admin.site.register(classreschedules)
admin.site.register(preclassreq)
admin.site.register(favourites)
admin.site.register(feeschedules)
