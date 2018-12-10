# users/views.py
from rest_framework import generics

from . import models
from . import serializers
from django.http import HttpResponse
from rest_framework.response import Response
from django.http import JsonResponse
from rest_framework import status
from django.shortcuts import render
from rest_framework.decorators import api_view
# users/views.py
from rest_framework import generics
from datetime import datetime
# users/views.py
#from django.http import JsonResponse
from .models import feeschedules,favourites,classreschedules,preclassreq,s_c_mapper,timetable,assignments,events,grades,day_parts,student,department ,course,faculty ,Admin,CustomUser
from .serializers import UserSerializer,feeschedulesSerializer,favouritesSerializer,s_c_mapperSerializer,classreschedulesSerializer,preclassreqSerializer,timetableSerializer,assignmentsSerializer,eventsSerializer,gradesSerializer,day_partsSerializer,studentSerializer,departmentSerializer,courseSerializer,facultySerializer,AdminSerializer
from django.views.decorators.csrf import csrf_exempt


class UserListView(generics.ListCreateAPIView):
    queryset = models.CustomUser.objects.all()
    serializer_class = serializers.UserSerializer

class AdminListView(generics.ListCreateAPIView):
    queryset = models.Admin.objects.all()
    serializer_class = serializers.AdminSerializer


# def app_login(request,token_id):
    
#     print("*********************************************************")
#     data = {'token' : token_id}
#     print(token_id)

#     payload = {'token': token_id, 'secret':"33414cc05a159b68a01b193903fdb5bc1fcfc53c3a435926d53c5ea80e22ad514eeb637374f185613fc17498f4e931d62dd0307e5540d521a0a3ae64717ab57b"}
#     url = "https://serene-wildwood-35121.herokuapp.com/oauth/getDetails"
#     return JsonResponse(data)

    # response=requests.post(url, data=payload)
    # data=response.json()
    # #print(data)
    # data=data['student']
    # try:
    #     user_object = User.objects.get(email=data[0]['Student_Email'])
    # except:
    #     user_object=User()
    # user_object.first_name=data[0]['Student_First_Name']
    # user_object.last_name=data[0]['Student_Last_name']
    # user_object.email=data[0]['Student_Email']
    # user_object.token=token_id
    # user_object.is_active = True
    # user_object.save()
    # auth_login(request,user_object)
    # return redirect(index)


    

#generating REST api for sending tables as array of dictionaries
@api_view(['GET'])
def get_admin_list(request):
    rest_list = Admin.objects.all()
    serializer = AdminSerializer(rest_list, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def get_faculty (request):
    rest_list = faculty.objects.all()
    serializer = facultySerializer(rest_list, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def get_course(request):
    rest_list = course.objects.all()
    serializer = courseSerializer(rest_list, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def get_department(request):
    rest_list = department.objects.all()
    serializer = departmentSerializer(rest_list, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def get_student(request):
    rest_list = student.objects.all()
    serializer = studentSerializer(rest_list, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def get_s_c_mapper(request):
    rest_list = s_c_mapper.objects.all()
    serializer = s_c_mapperSerializer(rest_list, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def get_day_parts(request):
    rest_list = day_parts.objects.all()
    serializer = day_partsSerializer(rest_list, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def get_grades(request):
    rest_list = grades.objects.all()
    serializer = gradesSerializer(rest_list, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def get_events(request):
    rest_list = events.objects.all()
    serializer = eventsSerializer(rest_list, many=True)
    print(request.data)
    
    # i = len(serializer.data)
    # for m in range(i):
    #         p=str(serializer.data[m]["post_time"])
    #         p=p[:19]
    #         p=p.replace('T',", ")
    #         serializer.data[m]["post_time"]=p
    #         #print(serializer.data[m]["post_time"])

    return Response(serializer.data)

@api_view(['GET'])
def get_assignments(request):
    rest_list = assignments.objects.all()
    serializer = assignmentsSerializer(rest_list, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def get_timetable(request):
    rest_list = timetable.objects.all()
    serializer = timetableSerializer(rest_list, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def get_preclassreq(request):
    rest_list = preclassreq.objects.all()
    serializer = preclassreqSerializer(rest_list, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def get_classreschedules(request):
    rest_list = classreschedules.objects.all()
    serializer = classreschedulesSerializer(rest_list, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def get_favourites(request):
    rest_list = favourites.objects.all()
    serializer = favouritesSerializer(rest_list, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def get_feeschedules(request):
    rest_list = feeschedules.objects.all()
    serializer = feeschedulesSerializer(rest_list, many=True)
    return Response(serializer.data)
    


@api_view(['POST'])
def post_data(request):
    print(request.data)
    return Response({
        "id": "done"
    })

# @api_view(['POST'])
# def post_favourites(request):
#     print(request.data)
#     fav = favourites()
#     # st=student.objects.get(slno=request.data[0]['slno'])
#     # eve = events.objects.get(slno=request.data[0]['slno'])
#     fav.student_id = student.objects.get(slno=request.data[0]['student_id'])
#     fav.event = events.objects.get(slno=request.data[0]['slno'])
#     fav.description = request.data[0]['description']
#     fav.save()
#     return Response({
#         "id": "done"
#     })

#generating REST api to receive data as array of dictionaries
@api_view(['POST'])
def post_favourites(request):
    print(request.data)
    fav = favourites()
    if(request.data[0]['starPress'] == True):
        print("hi---------------------------------------------------------------------------------------------")
        # print( )
        # rows = favourites.objects.get(event = request.data[0]['slno'])
        # for r in rows:
        #     if r.event
        if (favourites.objects.filter(event=request.data[0]['slno']).count()  == 0):
            st = student.objects.get(slno=request.data[0]['student_id'])
            eve = events.objects.get(slno=request.data[0]['slno'])
            fav.student_id = st
            fav.event = eve
            fav.event_datetime = request.data[0]['event_datetime']
            fav.post_time = request.data[0]['post_time']
            fav.event_name = request.data[0]['event_name']
            fav.event_type = request.data[0]['event_type']
            fav.description = request.data[0]['description']
            fav.save()
    else:
        if (favourites.objects.filter(event=request.data[0]['slno']).count() >0):
            (favourites.objects.get(event=request.data[0]['slno'])).delete()

    return Response({
        "id": "done"
    })

@api_view(['POST'])
def post_events(request):
    event = events()
    print(request.data)
    dt = department.objects.get(dept_id=request.data[0]['department_id'])
    c = course.objects.get(course_id=request.data[0]['course_id'])
    event.course_id = c
    event.department_id = dt

    event.studentdegree = request.data[0]['studentdegree']
    event.event_datetime = request.data[0]['event_datetime']
    #event.post_time =  datetime.now
    event.event_name = request.data[0]['event_name']
    event.event_type = request.data[0]['event_type']
    event.description = request.data[0]['description']
    event.save()
    return Response({
        "id": "done"
    })
    
@api_view(['POST'])
def post_classreschedules(request):
    
    clsres = classreschedules()

    clsres.course_id = course.objects.get(course_id=request.data[0]['course_id'])
    
    #clsres.post_time = request.data[0]['post_time']
    clsres.old_time = request.data[0]['oldtime']
    clsres.new_time = request.data[0]['newtime']
    clsres.old_date = request.data[0]['olddate']
    clsres.new_date = request.data[0]['newdate']
    clsres.old_room = request.data[0]['oldroom']
    clsres.new_room = request.data[0]['newroom']
    clsres.description = request.data[0]['description']
    clsres.save()
    return Response({
        "id": "done"
    })



@api_view(['POST'])
def post_preclassreq(request):
    print(request.data)

    pcr = preclassreq()
      
    pcr.course_id = course.objects.get(course_id = request.data[0]['course_id'])
    pcr.faculty_id = faculty.objects.get(slno=request.data[0]['faculty_id'])

    pcr.need_day = request.data[0]['need_day']
    pcr.content = request.data[0]['content']
    pcr.save()
    return Response({
        "id": "done"
    })

@api_view(['POST'])
def post_assignments(request):
    
    asgn = assignments()
    
    asgn.course_id = course.objects.get(course_id=request.data[0]['course_id'])
    asgn.studentdegree = request.data[0]['studentdegree']
    asgn.type = request.data[0]['type']
    asgn.name = request.data[0]['name']
    #asgn.post_time = request.data[0]['post_time']
    asgn.deadline = request.data[0]['deadline']
    asgn.description= request.data[0]['description']
    
    asgn.save()
    return Response({
        "id": "done"
    })


@api_view(['POST'])
def post_feeschedules(request):
    
    fs = feeschedules()
    
    
    fs.title = request.data[0]['title']
    fs.description  = request.data[0]['description']
    fs.studentdegree = request.data[0]['studentdegree']
    fs.due_date = request.data[0]['due_date']
    
    fs.save()
    return Response({
        "id": "done"
    })


@api_view(['POST'])
def post_course_assign_mix(request):
    #print("_______________________________________________________________________________")
    #print(request.data[0]['fac_id'])

    #print("_______________________________________________________________________________")
    results = assignments.course_assign_mix(request.data[0]['fac_id']) 
    #print(results)

    #print("_______________________________________________________________________________")
    return Response(results)

@api_view(['POST'])
def post_get_course_id(request):
    
    results = course.get_course_id(request.data[0]['cou_id']) 
    #print(results)
    return Response(results)


@api_view(['POST'])
def post_get_coursename(request):
    results = s_c_mapper.get_coursename(request.data[0]['stu_id'])
    # print(results)
    return Response(results)



@api_view(['POST'])
def post_get_preclassreq(request):
    
    results = preclassreq.mix_preclassreq_course(request.data[0]['fac_id']) 
    #print(results)
    return Response(results)


@api_view(['POST'])
def post_get_mix_mapper_preclassreq_course(request):
    
    results = preclassreq.mix_mapper_preclassreq_course(request.data[0]['stu_id']) 
    #print(results)
    return Response(results)


@api_view(['POST'])
def post_get_mix_mapper_classreschedules_course(request):
    results = classreschedules.mix_mapper_classreschedules_course(request.data[0]['stu_id'])
    # print(results)
    return Response(results)

@api_view(['POST'])
def post_get_mix_mapper_assignments_course(request):
    results = assignments.mix_mapper_assignments_course(request.data[0]['stu_id'])
    # print(results)
    return Response(results)



@api_view(['GET'])
def post_get_mix_classreschedule_course(request):
    # rest_list = classreschedules.objects.all()
    # serializer = classreschedulesSerializer(rest_list, many=True)
    results = classreschedules.mix_classreschedule_course()
    return Response(results)

@api_view(['POST'])
def post_verified(request):
    # rest_list = classreschedules.objects.all()
    # serializer = classreschedulesSerializer(rest_list, many=True)
    print(request.data[0]['member'])
    if(request.data[0]['member']==2):
        print("faculty")
        results=faculty.f_verified(request.data[0]['email_id'],request.data[0]['password'])
        print(results)
    else:
        print("admin")
        results=Admin.a_verified(request.data[0]['email_id'],request.data[0]['password'])
        print(results)
        
    # print(results)    
    if(results==[]):
        results={
                    "ans": "no"
                }
    print(results)
    return Response(results)

# @api_view(['POST'])
# def post_verified(request):
#     print("hii")
#     member = request.data[0]['member']
#     email_id = request.data[0]['email_id']
#     pw = request.data[0]['password']
#     print(member)
#     if(member == 2):
#         if( faculty.objects.filter(email=email_id).count()  != 0):
#             puppy = faculty.objects.filter(email=email_id)
#             print(puppy.faculty)


#             puppy1={ 'slno': "",
#             'faculty_id':"" ,
#             'dob':"" , 
#             'email': "" ,
#             'password ':"",
#             'name' : "",
#             'deptid': "",
#             'mobilenum': "",
#             } 
#             puppy=puppy.split(" ")
#             for i in range(len(puppy)):
#                 puppy1[i]=puppy[i]
#             print(puppy1)


#             if(puppy1.password == pw ):
#                 result = puppy1
#             else:
#                 result ={
#                     "ans": "no"
#                 }
#         else:
#            result ={
#                "ans": "no"
#            }    
#     else:
#         if (Admin.objects.filter(email=email_id).count()  != 0):
#             puppy = fadmin.objects.get(email=email_id)
#             print(puppy)

#             puppy1={ 'slno': "",
#             'admin_id':"" ,
#             'dob':"" , 
#             'name' : "",
#             'email': "" ,
#             'category': "",
#             'mobilenum': "",
#             'password ':"",
#             } 
#             puppy=puppy.split(" ")
#             for i in range(len(puppy)):
#                 puppy1[i]=puppy[i]
#             print(puppy1)


#             if(puppy.password == pw ):
#                 result = puppy
#             else:
#                 result ={
#                    "ans": "no"
#                 }
#         else:
#             result ={
#                 "ans": "no"
#             }
#     return Response(result)


"""

@api_view(['POST'])
def post_grades(request):


"""
