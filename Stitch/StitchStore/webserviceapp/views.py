from django.shortcuts import render, get_object_or_404
import json
from django.http import JsonResponse,HttpResponse
from .models import Usuarios, Producto, Perfil
from django.contrib.auth.hashers import make_password, check_password
import re
import jwt
from django.shortcuts import redirect
from django.urls import reverse
from django_countries.fields import CountryField
from django_countries import countries
# -------------------------------------------------------USUARIOS---------------------------------------------------#

# --------------------------------LOGIN Y LOGOUT

# Create your views here.


def login(request):
    return render(request, "login.html")

# metodo para iniciar sesion


def loginPOST(request):
    # validamos el método del formulario
    if (request.method != 'POST'):
        return None
    # guardamos los datos del formulario
    requestForm = request.POST.dict()

    # le asignamos un valor del form para cada variable
    nickname = requestForm.get('nickname')
    # comprobamos si el nickname del usuario coincide en la BD
    if ((nickname_existe_en_bd(request, nickname) == True)):

        usuario = Usuarios.objects.get(nombre=nickname)
        password = requestForm.get('password')
        # si el nombre está bien, comparamos la contraseá con la contraseña hasheada de ese usuario guardada en la BD
        #if check_password(password, usuario.password):
        if(password == usuario.password):
            # redirigmos al homepage Y guardamos el nombre del usuario en una cookie
            homepage = redirect('/home/')
            homepage.set_cookie('usuario', nickname)
            return homepage

        else:

            return render(request, "errors/errorPass.html")
    else:
        # falta: reenviar a un html de error
        return render(request, "errors/errorNickname.html")


# metodo para cerrar la sesion y borrar todas las cookies
def LogOut(request):
    logout = redirect('/login/')
    logout.delete_cookie('usuario')
    return logout


# -------------------------------VALIDACIONES DE COMPARACIÓN

# método para verificar si el usuario  existe en la base de datos
def nickname_existe_en_bd(request, nickname):
    # comprobamos si el nickname existe en la base de datos
    nick_exist = Usuarios.objects.filter(nombre=nickname).exists()

    # devolverá true si existe y false en caso contrario
    if nick_exist:
        return True
    else:
        return False


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

# metodo para verificar que al registrarse, no contiene nigún campo vacío


def campo_vacio_de_usuarios(nombre, email, password, rol):
    if len(nombre) == 0 or len(email) == 0 or len(password) == 0 or (rol) == "":
        return True
    else:
        return False

# método para validar un telefono existente


def telefono_existe_en_bd(request, telefono_form):
    tel_existe = Perfil.objects.filter(telefono=telefono_form).exists()
    if tel_existe:
        return True
    else:
        return False
def validar_telefono(request,telefono):
    pattern = "^\\+?[1-9][0-9]{7,14}$"
    if re.match(pattern,telefono):
        return True
    else:
        return False


# método para validar un dni existente
def dni_existe_en_bd(request, dni_form):
    dni_existe = Perfil.objects.filter(dni=dni_form).exists()
    if dni_existe:
        return True
    else:
        return False

def validar_dni(request,dni):
    regex = "[0-9]{8}[A-Za-z]"
    digitos = "TRWAGMYFPDXBNJZSQVHLCKE"
    invalido = {"00000000T", "00000001R", "99999999R"}
    
    if re.match(regex,dni) and dni not in invalido: 
        return True
    else:
        return False
def es_admin(request, usuario_logeado):
    admin = Usuarios.objects.get(nombre = usuario_logeado)
    if(admin.rol==True):
        return True
    else:
        return False

    
    
# -----------------------------------REDIRECCIONAMIENTO

# cuando se logeo redirige a la homepage
def goHome(request):
    # recogemos todos los productos de la bd
    productoData = Producto.objects.all()
    usuario_nombre = request.COOKIES.get('usuario')
    admin = Usuarios.objects.get(nombre = usuario_nombre)
    # guardamos variable que contiene todos los productos en un diccionario y la pasamos al html    
    context = {
        "productos":  productoData,
        "admin" : admin
    }

    
    # return redirect(reverse(request,"home.html",productoList))

    return render(request, "home.html", context)

# visualizar la pantalla de registro


def register(request):
    return render(request, "register.html")


# ----------------------------------REGISTER

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
    # verificamos si los datos no están vacíos
    if campo_vacio_de_usuarios(nickname, email, password, rol) == False:
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
                        # validamos la contraseña
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
                                token = jwt.encode(
                                    payload, secret, algorithm='HS256')
                                newUser.token = token
                                datosUser = {
                                    'nombre': newUser.nombre.upper()
                                }
                                newUser.save()
                                # falta: guardar los datos en la sesion
                                goRegisterDoneSuccesfully = render(
                                    request, "succesfully/registerDone.html", datosUser)
                                goRegisterDoneSuccesfully.set_cookie(
                                    'usuario', nickname)
                                # return JsonResponse({"status":"usuario registrad"})
                                # return render(request, "succesfully/registerDone.html", datosUser)
                                return goRegisterDoneSuccesfully
                            else:
                                # return JsonResponse({"erorr": "contraseña no coincide"})
                                return render(request, "errors/errorPass.html")
                        return render(request, "errors/errorPass.html")
                    else:
                        # return JsonResponse({"erorr": "email ya existe"})
                        return render(request, "errors/errorEmail.html")
                else:
                    # return JsonResponse({"erorr": "email invalido"})
                    return render(request, "errors/errorEmail.html")
            else:
                # return JsonResponse({"erorr": "usuario ya existe"})
                return render(request, "errors/errorNickname.html")
        else:
            # return JsonResponse({"erorr": "usuario ya existe"})
            return render(request, "errors/errorNickname.html")
    else:
        # return JsonResponse({"erorr": "usuario ya existe"})
        return render(request, "errors/errorNickname.html")


# -----------------------------------PERFIL


# metodo que redirige al usuario a un formulario para competar el perfil si el usuario no lo ha hecho todavía,
# si el usuario ya completó el perfil, se mostrará sus datos completos
def perfilForm(request):
    usuario_logeado = request.COOKIES.get('usuario')
    usuario = Usuarios.objects.get(nombre=usuario_logeado)
    usuario_id = Perfil.objects.filter(id_usuario=usuario.id).exists()
    if usuario_id:
        return render(request, "mostrarPerfil.html")
    else:
        return render(request, "perfilForm.html")
    

# metodo para completar el perfil del usuario
def perfilFormPost(request):
    # validamos el método del formulario
    if (request.method != 'POST'):
        return None
    # guardamos los datos del formulario
    requestForm = request.POST.dict()
    usuario_nombre = request.COOKIES.get('usuario')
    telefono_input = requestForm.get('telefono')
    dni_input = requestForm.get('DNI')
    region_input = requestForm.get('pais')
    direccion_input = requestForm.get('direccion')
    fecha_nacimiento_input = requestForm.get("fecha_nacimiento")
    pais_input = requestForm.get("pais")
    perfil_usuario = Perfil()
    usuario = Usuarios.objects.get(nombre=usuario_nombre)
    usuario_id = get_object_or_404(Usuarios, id=usuario.id)
    #validamos el número de teléfono  
    if telefono_existe_en_bd(request, telefono_input) == False and validar_telefono(request,telefono_input) == True:
        pass
        if dni_existe_en_bd(request, dni_input) == False and validar_dni(request,dni_input) == True:
            pass
            perfil_usuario.id_usuario = usuario_id
            perfil_usuario.telefono = telefono_input
            perfil_usuario.dni = dni_input
            perfil_usuario.pais = region_input
            perfil_usuario.fecha_nacimiento = fecha_nacimiento_input
            perfil_usuario.direccion = direccion_input
            perfil_usuario.pais = pais_input
            #guardamos los registros en la base de datos
            perfil_usuario.save()
            return render(request, "succesfully/perfilDone.html")
                
        else:
            # return JsonResponse({"status" : "dni ya existe"})
            return render(request, "errors/errorDNI.html")
    else:
        # return JsonResponse({"status" : "telefono ya existe"})
        return render(request, "errors/errorTelefono.html")




# ----------------------------------------------------------FINUSUARIOS----------------------------------------#


#-----------------------------------------------------ADMIN--------------

def administradorOperaciones(request):
    usuarios = Usuarios.objects.all()
    context = {
        'usuarios' : usuarios
    }
    return render(request,"adminController.html",context)

# ---------------------productos-------------------------#
