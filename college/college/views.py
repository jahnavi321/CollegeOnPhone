



# users/views.py
from rest_framework import generics



from django.http import HttpResponse
from rest_framework.response import Response
from django.http import JsonResponse

from django.shortcuts import render








def app_login(request,token_id):
    
    print("*********************************************************")
    data = {'token' : token_id}
    print(token_id)

    payload = {'token': token_id, 'secret':"33414cc05a159b68a01b193903fdb5bc1fcfc53c3a435926d53c5ea80e22ad514eeb637374f185613fc17498f4e931d62dd0307e5540d521a0a3ae64717ab57b"}
    url = "https://serene-wildwood-35121.herokuapp.com/oauth/getDetails"
    return JsonResponse(data)
