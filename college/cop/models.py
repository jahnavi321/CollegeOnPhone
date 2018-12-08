from django.db import models
from django.contrib.auth.models import User
from  django.utils import timezone
from datetime import datetime

from django.db import models
from django.contrib.auth.models import AbstractUser
from django.conf import settings
from django.db import connection

# Create your models here.

class CustomUser(AbstractUser):
    name = models.CharField(blank=True, max_length=255)

    def __str__(self):
        return self.email

#creation of models
class Admin(models.Model):
    slno = models.AutoField(primary_key=True)
    admin_id = models.CharField(max_length = 100)
    dob = models.DateField(default=datetime.now)
    name = models.CharField(max_length = 100)
    email = models.CharField(max_length = 100)
    category = models.CharField(max_length = 100)
    mobilenum = models.CharField(max_length = 12)
    password = models.CharField(max_length = 100)
    def __str__(self):
        return str(str(self.slno) +' '+self.admin_id +' '+ str(self.dob) +' '+self.name +' '+self.email +' '+self.category +' '+ self.mobilenum +' '+self.password)

    @staticmethod  
    def a_verified(email_id,password_id):  
        # create a cursor  
        cur = connection.cursor()  
        # execute the stored procedure passing in   
        # search_string as a parameter  
        cur.callproc('a_verified', [email_id,password_id,])  
        # grab the results  
        columns = [col[0] for col in cur.description]
        results= [
            dict(zip(columns, row))
            for row in cur.fetchall()
        ]
        #results = cur.fetchall()
        # print("****")
        # print(len(results)) 
        
        cur.close()  

        # wrap the results up into Document domain objects   
        return results

class department(models.Model):
    dept_id = models.AutoField(primary_key=True)
    dept_name = models.CharField(max_length = 100)
    def __str__(self):
        return str(self.dept_id)

class faculty(models.Model):
    slno = models.AutoField(primary_key=True)
    faculty_id = models.CharField(max_length=100)
    dob = models.DateField(default=datetime.now)
    email = models.CharField(max_length=100)
    password = models.CharField(max_length=100)
    name = models.CharField(max_length = 100)
    deptid = models.ForeignKey(department, on_delete=models.CASCADE)
    mobilenum = models.CharField(max_length = 12)
    def __str__(self):
        return str(str(self.slno) +' '+self.faculty_id +' '+ str(self.dob) +' '+self.email +' '+self.password +' '+self.name +' '+ str(self.deptid) +' '+self.mobilenum)
    @staticmethod  
    def f_verified(email_id,password_id):  
        # create a cursor  
        cur = connection.cursor()  
        # execute the stored procedure passing in   
        # search_string as a parameter  
        cur.callproc('f_verified', [email_id,password_id,])  
        # grab the results  
        columns = [col[0] for col in cur.description]
        results= [
            dict(zip(columns, row))
            for row in cur.fetchall()
        ]
        #results = cur.fetchall()
        # print("****")
        # print(len(results)) 
        
        cur.close()  

        # wrap the results up into Document domain objects   
        return results


class course(models.Model):
    course_id = models.AutoField(primary_key=True)
    course_name = models.CharField(max_length=100)
    faculty_id = models.ForeignKey(faculty, on_delete=models.CASCADE)
    credits = models.IntegerField(default=0)
    def __str__(self):
        return str(self.course_id)

    @staticmethod  
    def get_course_id(cou_id):  
        # create a cursor  
        cur = connection.cursor()  
        # execute the stored procedure passing in   
        # search_string as a parameter  
        cur.callproc('get_course_id', [cou_id,])  
        # grab the results  
        columns = [col[0] for col in cur.description]
        results= [
            dict(zip(columns, row))
            for row in cur.fetchall()
        ]
        #results = cur.fetchall()
        # print("****")
        # print(len(results)) 
        
        cur.close()  

        # wrap the results up into Document domain objects   
        return results


class student(models.Model):
    slno = models.AutoField(primary_key=True)
    student_id = models.CharField(max_length = 15)
    dob = models.DateField(default=datetime.now)
    yoj = models.DateField(default=datetime.now)

    name = models.CharField(max_length = 100)
    email = models.CharField(max_length=100)
    password = models.CharField(max_length=100)
    deptid = models.ForeignKey(department,on_delete= models.CASCADE)
    mobilenum = models.CharField(max_length = 12)
    studentdegree= models.CharField(max_length =100)
    grade = models.FloatField(default = 0)
    def __str__(self):
        return str(self.student_id)

# model to map student and course
class s_c_mapper(models.Model):
    slno = models.AutoField(primary_key=True)
    # sid = models.ForeignKey(student, on_delete=models.CASCADE)
    student_id = models.CharField(max_length=20)
    cid = models.ForeignKey(course,on_delete= models.CASCADE)

#day parts represent the time and day parts in a timetable
class day_parts(models.Model):
    slno = models.AutoField(primary_key=True)
    slot_no = models.CharField(max_length=100)
    start_time = models.CharField(max_length = 100)
    end_time = models.CharField(max_length = 100)
    def __str__(self):
        return str(self.slot_no)

# class type_marks(models.Model):
#     slno = models.AutoField(primary_key=True)
#     course_id = models.ForeignKey(course,on_delete = models.CASCADE)
#     type = models.CharField(max_length=20)
#     weightage = models.IntegerField(default=0)
#     def __str__(self):
#         return str(self.grade)

class assignments(models.Model):
    slno = models.AutoField(primary_key=True)
    course_id = models.ForeignKey(course, on_delete=models.CASCADE)
    studentdegree = models.CharField(max_length=100)
    type = models.CharField(max_length=20)
    name = models.CharField(max_length=20)
    post_time = models.DateTimeField(default=datetime.now)
    deadline = models.CharField(max_length=20)
    description= models.CharField(max_length =4000)
    def __str__(self):
        return str(self.event_name)

    @staticmethod  
    def course_assign_mix(fac_id):  
        # create a cursor  
        cur = connection.cursor()  
        # execute the stored procedure passing in   
        # search_string as a parameter  
        cur.callproc('course_assign_mix', [fac_id,])  
        # grab the results  
        columns = [col[0] for col in cur.description]
        results= [
            dict(zip(columns, row))
            for row in cur.fetchall()
        ]
        #results = cur.fetchall()
        # print("****")
        # print(len(results)) 
        
        cur.close()  

        # wrap the results up into Document domain objects   
        return results


class grades(models.Model):
    slno = models.AutoField(primary_key=True)
    course_id = models.ForeignKey(course, on_delete=models.CASCADE)
    student_id = models.ForeignKey(student, on_delete=models.CASCADE)
    type = models.CharField(max_length=20)
    weightage = models.IntegerField(default=0)
    marks = models.IntegerField(default=0)
    total_marks = models.IntegerField(default=0)
    assignment_id = models.ForeignKey(assignments, on_delete=models.CASCADE)
    def __str__(self):
        return str(self.marks)

#for all events academic and general events
class events(models.Model):
    slno = models.AutoField(primary_key=True)
    studentdegree = models.CharField(max_length=100)
    department_id =  models.ForeignKey(department, on_delete=models.CASCADE)
    course_id = models.ForeignKey(course, on_delete=models.CASCADE)
    event_datetime = models.CharField(max_length=100)
    post_time = models.DateTimeField( default= datetime.now)
    event_name = models.CharField(max_length = 100)
    event_type = models.CharField(max_length=100)
    description= models.CharField(max_length =4000)
    def __str__(self):
        return str(self.event_name)


class timetable(models.Model):
    slno = models.AutoField(primary_key=True)
    #studentdegree = models.CharField(max_length=100)
    slot_no = models.ForeignKey(day_parts, on_delete = models.CASCADE)
    day = models.CharField(max_length = 100)
    room_no = models.IntegerField(default=101)
    course_id = models.ForeignKey(course,on_delete=models.CASCADE)
    def __str__(self):
        return str(self.slot_no)



class classreschedules(models.Model):
    slno = models.AutoField(primary_key=True)
    post_time = models.DateTimeField(default=datetime.now)
    course_id = models.ForeignKey(course,on_delete = models.CASCADE)
    # old_time = models.TimeField( auto_now_add=True, blank=True)
    # new_time = models.TimeField( auto_now_add=True, blank=True)
    # old_date = models.DateField( default= datetime.now)
    # new_date = models.DateField( default= datetime.now)
    old_time = models.CharField(max_length = 100)
    new_time = models.CharField(max_length = 100)
    old_date = models.CharField(max_length = 100)
    new_date = models.CharField(max_length = 100)
    old_room = models.IntegerField(default=101)
    new_room = models.CharField(max_length = 100)
    description = models.CharField(max_length=4000)
    def __str__(self):
        return str(self.new_time)

    
    @staticmethod  
    def mix_classreschedule_course():  
        # create a cursor  
        cur = connection.cursor()  
        # execute the stored procedure passing in   
        # search_string as a parameter  
        cur.callproc('mix_classreschedule_course', [])  
        # grab the results  
        columns = [col[0] for col in cur.description]
        results= [
            dict(zip(columns, row))
            for row in cur.fetchall()
        ]
        #results = cur.fetchall()
        # print("****")
        # print(len(results)) 
        
        cur.close()  

        # wrap the results up into Document domain objects   
        return results
    


class preclassreq(models.Model):
    slno = models.AutoField(primary_key=True)
    post_time = models.DateTimeField(default=datetime.now)
    need_day = models.CharField(max_length = 100)
    course_id = models.ForeignKey(course, on_delete=models.CASCADE)
    faculty_id = models.ForeignKey(faculty, on_delete=models.CASCADE)
    content = models.CharField(max_length=4000)

    def __str__(self):
        return str(self.content)
    @staticmethod  
    def mix_mapper_preclassreq_course(stu_id):  
        # create a cursor  
        cur = connection.cursor()  
        # execute the stored procedure passing in   
        # search_string as a parameter  
        cur.callproc('mix_mapper_preclassreq_course', [stu_id,])  
        # grab the results  
        columns = [col[0] for col in cur.description]
        results= [
            dict(zip(columns, row))
            for row in cur.fetchall()
        ]
        #results = cur.fetchall()
        # print("****")
        # print(len(results)) 
        
        cur.close()  

        # wrap the results up into Document domain objects   
        return results


    @staticmethod  
    def mix_preclassreq_course(fac_id):  
        # create a cursor  
        cur = connection.cursor()  
        # execute the stored procedure passing in   
        # search_string as a parameter  
        cur.callproc('mix_preclassreq_course', [fac_id,])  
        # grab the results  
        columns = [col[0] for col in cur.description]
        results= [
            dict(zip(columns, row))
            for row in cur.fetchall()
        ]
        #results = cur.fetchall()
        # print("****")
        # print(len(results)) 
        
        cur.close()  

        # wrap the results up into Document domain objects   
        return results

#model created to keep track of your favourite events
class favourites(models.Model):
    slno = models.AutoField(primary_key=True)
    event = models.ForeignKey(events, on_delete=models.CASCADE)
    student_id = models.ForeignKey(student, on_delete=models.CASCADE)
    event_datetime = models.CharField(max_length=100)
    post_time = models.DateTimeField( default= datetime.now)
    event_name = models.CharField(max_length = 100)
    event_type = models.CharField(max_length=100)
    description= models.CharField(max_length =4000)
    def __str__(self):
        return str(self.event_name)


class feeschedules(models.Model):
    slno = models.AutoField(primary_key=True)
    title = models.CharField(max_length = 1000)
    description  = models.CharField(max_length = 1000)
    studentdegree = models.CharField(max_length=100)
    due_date = models.CharField(max_length=100)

    def __str__(self):
        return str(self.title)