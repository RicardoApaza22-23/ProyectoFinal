from django.shortcuts import render
import json
from django.http import JsonResponse
# Create your views here.
def login(request):
    return render(request,"login.html")
def loginPOST(request):
    requestForm = request.POST.dict()
    nickname = requestForm.get('nickname')
    return JsonResponse({"status" : nickname})
    