from django.shortcuts import render
import json
from django.http import JsonResponse
from .models import Usuarios, Producto
from django.contrib.auth.hashers import make_password, check_password
import re
import jwt
from django.shortcuts import redirect
from django.urls import reverse

# ---------------------usuarios--------------------#

# Create your views here.


def login(request):
    return render(request, "login.html")

# metodo para verificar que al registrarse, no contiene nigún campo vacío


def campo_vacio_de_usuarios(nombre, email, password, rol):
    if len(nombre) == 0 or len(email) == 0 or len(password) == 0 or (rol) == "":
        return True
    else:
        return False

# método para verificar si el usuario  existe en la base de datos


def nickname_existe_en_bd(request, nickname):
    # comprobamos si el nickname existe en la base de datos
    nick_exist = Usuarios.objects.filter(nombre=nickname).exists()

    # devolverá true si existe y false en caso contrario
    if nick_exist:
        return True
    else:
        return False

# metodo para iniciar sesion
def loginPOST(request):
    # validamos el método del formulario
    if (request.method != 'POST'):
        return None
    # guardamos los datos del formulario
    requestForm = request.POST.dict()

    # le asignamos un valor del form para cada variable
    nickname = requestForm.get('nickname')
    if ((nickname_existe_en_bd(request, nickname) == True)):

        usuario = Usuarios.objects.get(nombre=nickname)

        password = requestForm.get('password')
        # falta: hashear la contraseña
        # if check_password(password,usuario.password):
        if password == usuario.password:
            #redirigmos al homepage
            
            homepage = redirect('/home/')
            homepage.set_cookie('usuario',nickname)
           
            return homepage
            
        else:
            # falta: reenviar a un html de error
            return JsonResponse({"status": "contraseña incorrecta"})
    else:
        # falta: reenviar a un html de error
        return JsonResponse({"status": "nombre de usuario no coincide en la BD"})


#metodo para cerrar la sesion y borrar todas las cookies
def LogOut(request):
    logout = redirect('/login/')
    logout.delete_cookie('usuario')
    return logout


def perfilForm(request):   
    return render(request,"perfilForm.html")


def perfilPost(request):
    return JsonResponse({"status": "perfil"})


# cuando se logeo redirige a la homepage
def goHome(request):
    #recogemos todos los productos de la bd
    productoData = Producto.objects.all()
    #guardamos variable que contiene todos los productos en un diccionario y la pasamos al html
    productoContext={
    "productos" :  productoData
    }  
    #return redirect(reverse(request,"home.html",productoList))
    
    return render(request,"home.html",productoContext)
    
    # home_page = redirect('/home/')
    # return home_page


# def home_page(request):
#     # return redirect("/home")
#     gohome = redirect('/home/')
#     return gohome
#     #return goHome()





# visualizar la pantalla de registro
def register(request):
    return render(request, "register.html")


# metodo para comparar dos contraseñas(o cualquier variable)
def compara_datos(dato1, dato2):
    if dato1 == dato2:
        return True
    else:
        return False

# metodo para validar email


def email_check(email):
    regex = r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,7}\b'
    if (re.fullmatch(regex, email)):
        return True
    else:
        return False

# método para validar un email existente


def email_existe_en_bd(request, email_form):
    email_exist = Usuarios.objects.filter(email=email_form).exists()
    if email_exist:
        return True
    else:
        return False

# metodo para validar el nickname


def nickname_validate(nickname):
    # será un nickname formado de 6 a 14 letras
    regex = r'\b[A-Z a-z ]{3,30}\b'
    if re.fullmatch(regex, nickname):
        return True
    else:
        return False
# validamos el password


def password_validate(password):
    # será un password formado de 6 a 14 caracteres
    regex = r'\b[A-Za-z0-9!?¿¡]{6,40}\b'
    if re.fullmatch(regex, password):
        return True
    else:
        return False

# metodo para registrar un usuario
def registerPOST(request):
    # solo aceptamos POST
    if (request.method != 'POST'):
        return None
    # guardamos los request
    form_register = request.POST.dict()
    # y asignamos valores para mayor seguridad
    nickname = form_register.get('nickname')
    password = form_register.get('password')
    password_repeat = form_register.get('password_repeat')
    rol = form_register.get('rol')
    email = form_register.get('email')
    #verificamos si los datos no están vacíos
    if campo_vacio_de_usuarios(nickname,email,password,rol) == False:
    # validamos el campo nickname
        pass
        if nickname_validate(nickname) == True:
                # si el nombre no existe en la bd se sigue con el proceso
            pass    
            if nickname_existe_en_bd(request, nickname) == False: 
                pass
                # si el email es valido, seguimos adelante con el registro
                if email_check(email) == True:
                    pass
                    # si el email no está en la bd, seguimos
                    if email_existe_en_bd(request, email) == False:

                        pass
                        #validamos la contraseña
                        if password_validate(password) == True:
                            # si las contraseñas coinciden, finalmente procedemos a crear el usuario
                            if compara_datos(password, password_repeat) == True:
                                newUser = Usuarios()
                                newUser.nombre = nickname
                                newUser.email = email
                                # hasheamos la password
                                pass_hash = make_password(password)
                                newUser.password = pass_hash
                                newUser.rol = rol
                                # generamos un token
                                secret = 'secreto_word'
                                payload = {
                                'user_id': newUser.id,
                                'username': newUser.nombre
                                }
                                token = jwt.encode(payload, secret, algorithm='HS256')
                                newUser.token = token
                                datosUser = {
                                    'nombre': newUser.nombre.upper()
                                }
                                # newUser.save()
                                # falta: guardar los datos en la sesion
                                # return JsonResponse({"status":"usuario registrad"})
                                return render(request, "succesfully/registerDone.html", datosUser)
                            else:
                                # return JsonResponse({"erorr": "contraseña no coincide"})
                                return render(request, "errors/errorPass.html")
                        return render(request, "errors/errorPass.html")
                    else:
                        #return JsonResponse({"erorr": "email ya existe"})
                        return render(request,"errors/errorEmail.html")
                else:
                    #return JsonResponse({"erorr": "email invalido"})
                    return render(request,"errors/errorEmail.html")
            else:
                #return JsonResponse({"erorr": "usuario ya existe"})               
                return render(request,"errors/errorNickname.html")
        else:
            #return JsonResponse({"erorr": "usuario ya existe"})               
            return render(request,"errors/errorNickname.html")
    else:
        #return JsonResponse({"erorr": "usuario ya existe"})               
        return render(request,"errors/errorNickname.html")
    

#---------------------------------------------------#

#---------------------productos-------------------------#

