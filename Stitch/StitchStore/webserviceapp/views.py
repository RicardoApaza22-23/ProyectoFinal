from django.shortcuts import render
import json
from django.http import JsonResponse
from .models import Usuarios
from django.contrib.auth.hashers import make_password,check_password

# Create your views here.
def login(request):
    return render(request,"login.html")


#método para verificar si el usuario  existe en la base de datos
def nickname_existe_en_bd(request,nickname):
    #comprobamos si el nickname existe en la base de datos
    nick_exist = Usuarios.objects.filter(nombre = nickname).exists() 
    
    #devolverá true si existe y false en caso contrario
    if nick_exist:
        return True
    else:
        return False

#metodo para iniciar sesion
def loginPOST(request):
    #validamos el método del formulario
    if(request.method!='POST'):
        return None
    #guardamos los datos del formulario 
    requestForm = request.POST.dict()
    
    #le asignamos un valor del form para cada variable
    nickname = requestForm.get('nickname')
    if ((nickname_existe_en_bd(request,nickname) == True)):
        
        usuario = Usuarios.objects.get(nombre = nickname)
         
        password = requestForm.get('password')
        #if check_password(password,usuario.password):
        if password == usuario.password:
            
            
            return JsonResponse({"status" : "login correcto" })
            
        else:
            return JsonResponse({"status" : "contraseña incorrecta"})
    else:
        return JsonResponse({"status" : "nombre de usuario no coincide en la BD"})
    
#visualizar la pantalla de registro
def register(request):
    return render(request,"register.html")
#metodo para registrar un usuario

    
   
    