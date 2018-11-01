from rest_framework import serializers
from . import models
#Serializers allow complex data such as querysets and model instances to be converted to native
# Python datatypes that can then be easily rendered into JSON, XML or other content types.
class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.CustomUser
        fields = ('email', 'username', )

class AdminSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Admin
        fields = ('slno','admin_id','dob','name','email','category','mobilenum','password',)

#serializing models
class departmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.department
        fields = ('dept_id','dept_name',)

class facultySerializer(serializers.ModelSerializer):
    class Meta:
        model = models.faculty
        fields = ('slno','faculty_id','dob','email','password','name','deptid','mobilenum',)

class courseSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.course
        fields = ('course_id','course_name','faculty_id','credits',)

class studentSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.student
        fields = ('slno','student_id','dob','yoj','name','email','password','deptid','mobilenum','studentdegree','grade')

class s_c_mapperSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.s_c_mapper
        fields = ('slno','sid','cid',)

class day_partsSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.day_parts
        fields = ('slno','slot_no','start_time','end_time',)

# class type_marksSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = models.type_marks
#         fields = ('slno','course_id','type','weightage',)

class gradesSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.grades
        fields = ('slno','course_id','student_id','type','weightage','marks','total_marks','assignment_id')

class eventsSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.events
        fields = ('slno','department_id','course_id','studentdegree','event_datetime','post_time','event_name','event_type','description',)

class assignmentsSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.assignments
        fields = ('slno','course_id','studentdegree','name','type','post_time','deadline','description',)

class timetableSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.timetable
        fields = ('slno','studentdegree','slot_no','day','room_no','course_id',)

class classreschedulesSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.classreschedules
        fields = ('slno','post_time','course_id','old_time','new_time','old_date','new_date','old_room','new_room','description',)

class preclassreqSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.preclassreq
        fields = ('slno','post_time','need_day','course_id','faculty_id','content',)

class favouritesSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.favourites
        fields = ('slno','event','student_id','event_datetime','post_time','event_name','event_type','description',)
