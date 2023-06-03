from django.shortcuts import render, get_object_or_404
import json
from django.http import JsonResponse,HttpResponse,HttpResponseRedirect
from .models import Usuarios, Producto, Perfil, Carrito,Estacion,EstacionProducto,Etiqueta,ProductoEtiqueta,Favoritos
from django.contrib.auth.hashers import make_password, check_password
import re
import jwt
from django.shortcuts import redirect
from django.shortcuts import render
from django.urls import reverse
from django_countries.fields import CountryField
from django_countries import countries
from datetime import datetime
from django.contrib import messages
from random import randrange
from django.core import serializers
from django.core.files.storage import FileSystemStorage
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
    
    #productos = Producto.objects.all()
    # guardamos los datos del formulario
    requestForm = request.POST.dict()

    # le asignamos un valor del form para cada variable
    nickname = requestForm.get('nickname')
    # comprobamos si el nickname del usuario coincide en la BD
    if ((nickname_existe_en_bd(request, nickname) == True)):

        usuario = Usuarios.objects.get(nombre=nickname)
        password = requestForm.get('password')
        # si el nombre está bien, comparamos la contraseá con la contraseña hasheada de ese usuario guardada en la BD
        if check_password(password, usuario.password):
        #if(password == usuario.password):
            id_carrito = usuario.nombre +"_"+ str(randrange(1000))
            # redirigmos al homepage Y guardamos el nombre del usuario en una cookie
            homepage = redirect('/home/')
            homepage.set_cookie('usuario', nickname)
            homepage.set_cookie('id_usuario',usuario.id)
            request.session['cesta'] = []
            request.session['id_cesta'] = id_carrito
            return homepage

        else:

            return render(request, "errors/errorPass.html")
    else:
        
        return render(request, "errors/errorNickname.html")


# metodo para cerrar la sesion y borrar todas las cookies
def LogOut(request):
    logout = redirect('/login/')
    logout.delete_cookie('usuario')
    logout.delete_cookie('id_usuario')
    #if request.session:
        #del request.session['cesta']
        #del request.session['id_cesta']
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
def es_admin(request, id_usuario):
    admin = Usuarios.objects.get(pk =id_usuario)
    if(admin.rol==True):
        return True
    else:
        return False

#validaremos la fecha para que no sea un date futuro
def comparar_fechas(fecha_comprobar): 
    fecha_actual =(datetime.today().strftime('%Y-%m-%d'))
    if(fecha_actual > fecha_comprobar):
        return True
    else:
        return False
    
    
    
# -----------------------------------REDIRECCIONAMIENTO

# cuando se logeo redirige a la homepage
def goHome(request):
    # recogemos todos los productos de la bd
    productoData = Producto.objects.all()
    usuario_logeado_id = request.COOKIES.get('id_usuario')
    estaciones = Estacion.objects.all()
    etiquetas_categoría = Etiqueta.objects.all().exclude(nombre = "Chaqueta").exclude(nombre = "Camiseta").exclude(nombre = "Pantalones").exclude(nombre="Sneakers")
    etiquetas_prendas = Etiqueta.objects.all().exclude(nombre="Hombre").exclude(nombre="Mujer").exclude(nombre="Niños")
    context = {
        "productos" : productoData,
        "estaciones" : estaciones,
        "etiquetas" : etiquetas_categoría,
        "prendas" : etiquetas_prendas
    }
    if usuario_logeado_id:
        if es_admin(request,usuario_logeado_id) == True:
            admin = Usuarios.objects.get(pk = usuario_logeado_id)
        # guardamos variable que contiene todos los productos en un diccionario y la pasamos al html    
            context = {
                "productos":  productoData,
                "admin" : admin,
                "estaciones" : estaciones,
                "etiquetas" : etiquetas_categoría,
                "prendas" : etiquetas_prendas
            }
            return render(request, "home.html", context)
        return render(request,"home.html",context)
    else:
        return render(request,"home.html",context)

#vista para mostrar un template de los productos de cada estación
def mostrarProductosEstacion(request,estacion_nombre):
    estaciones = Estacion.objects.all()
    estacion = Estacion.objects.get(nombre = estacion_nombre)
    producto_estacion = EstacionProducto.objects.filter(id_estacion = estacion.id)
    producto_estacion_existe = EstacionProducto.objects.filter(id_estacion = estacion.id).exists()
    #aquí usamos el exclude porque tenemos distribuídas las etiquetas en lugares diferenes
    etiquetas_categoría = Etiqueta.objects.all().exclude(nombre = "Chaqueta").exclude(nombre = "Camiseta").exclude(nombre = "Pantalones").exclude(nombre="Sneakers")
    etiquetas_prendas = Etiqueta.objects.all().exclude(nombre="Hombre").exclude(nombre="Mujer").exclude(nombre="Niños")
    #si hay productos que contengan la estación que se solicita, entonces se guarda a información de ese producto y se envía al template
    if producto_estacion_existe:
        ids_productos = []
        for prod in producto_estacion:
            ids_productos.append(prod.id_producto.id)
        
                
        productosList = []
        
        for iden in ids_productos:
            productos = Producto.objects.filter(id = iden)
            
            for prod in productos:
                diccionario = {}
                diccionario['id'] = prod.id
                diccionario['nombre'] = prod.nombre
                diccionario['precio'] = prod.precio
                diccionario['descripcion'] = prod.descripcion
                productosList.append(diccionario)

                
        context = {
            'productos' : productosList,
            'estaciones' : estaciones,
            'etiquetas' : etiquetas_categoría,
            'prendas' : etiquetas_prendas
        }
        #si el usuario es admin tendrá superpoderes
        if request.COOKIES.get('id_usuario'):
            id_usuario = request.COOKIES.get('id_usuario')
            if es_admin(request,id_usuario):
                admin = Usuarios.objects.get(id = id_usuario)
                context['admin'] = admin
        #fin IF
        return render(request,"home_estacion.html",context)
    else:#ELSE: que retorna a homepage si no existe nigún producto con la estación que se solicita
        return redirect("/home/")

    
#vista para mostrar los productos que contengan la etiqueta que se colicita    
def mostrarProductosEtiquetas(request, etiqueta_nombre):
    estaciones = Estacion.objects.all()
    #usamos exclude para separar la distribución de las etiquetas
    etiquetas_categoría = Etiqueta.objects.all().exclude(nombre = "Chaqueta").exclude(nombre = "Camiseta").exclude(nombre = "Pantalones").exclude(nombre="Sneakers")
    etiquetas_prendas = Etiqueta.objects.all().exclude(nombre="Hombre").exclude(nombre="Mujer").exclude(nombre="Niños")
    etiqueta = Etiqueta.objects.get(nombre = etiqueta_nombre)
    etiqueta_producto = ProductoEtiqueta.objects.filter(id_etiqueta = etiqueta.id)
    etiqueta_producto_existe = ProductoEtiqueta.objects.filter(id_etiqueta = etiqueta.id).exists()
    #si hay productos con dicha etiqueta se guarda la información para pasársela al template
    if etiqueta_producto_existe:
        ids_productos = []
        for prod in etiqueta_producto:
            ids_productos.append(prod.id_producto.id)
        
        productoList = [] 
        for iden in ids_productos:
            productos = Producto.objects.filter(id = iden)
            for prod in productos:
                diccionario = {}
                diccionario['id'] = prod.id
                diccionario['nombre'] = prod.nombre
                diccionario['foto'] = prod.foto
                diccionario['precio'] = prod.precio
                diccionario['descripcion'] = prod.descripcion
                productoList.append(diccionario)
                
        
        context = {
            'estaciones' : estaciones,
            'etiquetas' : etiquetas_categoría,
            'productos' : productoList,
            'prendas' : etiquetas_prendas
        }
        #si el usuario es admin tendrá superpoderes
        if request.COOKIES.get('id_usuario'):
            id_usuario = request.COOKIES.get('id_usuario')
            if es_admin(request,id_usuario) == True:
                admin = Usuarios.objects.get(id = id_usuario) 
                context['admin'] = admin
                
        return render(request,"home_etiquetas.html",context)
    return redirect("/home/")
    

# ----------------------------------REGISTER
 
def register(request):
    return render(request, "register.html")

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
                                
                                goRegisterDoneSuccesfully = render(
                                request, "succesfully/registerDone.html", datosUser)
                                goRegisterDoneSuccesfully.set_cookie('usuario', nickname)
                                goRegisterDoneSuccesfully.set_cookie('id_usuario', newUser.id)
                                id_carrito = newUser.nombre +"_"+ str(randrange(1000))
                                request.session['cesta'] = []
                                request.session['id_cesta'] = id_carrito
                                
                                
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

#falta: mostrar operaciones sobre todas las tablas : user,producto,etiqueta,estacion


#un apartado temmplate para las operaciones del administrador con todo el contenido y podeeres
def administradorOperaciones(request):
    #encontramos al usuario
    usuarios = Usuarios.objects.all()
    usuario_id_cookie = request.COOKIES.get("id_usuario")
    productos = Producto.objects.all()
    #falta: subir ejemplos de productos
    context = {
        'usuarios' : usuarios,
        'productos' : productos
    }
    #verificamos si el usuario es admin 
    if(usuario_id_cookie != 0):
        usuario_logeado = Usuarios.objects.get(pk = usuario_id_cookie)
        if es_admin(request,usuario_logeado.id):
            admin = Usuarios.objects.get(id = usuario_logeado.id)
            context['admin'] = admin
        if((usuario_logeado.rol == 1)):
            return render(request,"admin/adminController.html",context)
        else:
            
            return render(request, "errors/errorAdmin.html")

    else:
        return JsonResponse({"status":"no hay usuario"})

#método para editar los datos de los usuarios
#enviamos la información del usuario en cuestión a un formulario dónde podremos editarlo
def adminEditarUsuario(request,id_usuario_editar):
    usuario = Usuarios.objects.get(pk=id_usuario_editar)
    perfil_existe = Perfil.objects.filter(id_usuario = id_usuario_editar).exists()
    if request.COOKIES.get('id_usuario'):
        usuario_logeado = request.COOKIES.get('id_usuario')
        if es_admin(request,usuario_logeado):
            if(perfil_existe):
                perfil = Perfil.objects.get(id_usuario = id_usuario_editar)
                context = {
                'usuario' : usuario,      
                'perfil' : perfil
            }
            else:
                context = {
                'usuario' : usuario
                }
            
            return render(request,"admin/editarUsuario.html",context)
        else:
            return redirect("/home/")
    else:
        return redirect("/login/")


    
    
#abc123abc    
#Método que recibe la información enviada por el formulario cuando se edita un usuario
#validamos todos los campos y si todo está correcto, procedemos a guardar el usuario
def editarUsuarioFormPost(request):
    request_form = request.POST.dict()
    id_usuario_request = request_form["usuario_id"]
    usuario_request = request_form["nickname"]
    usuario_bd = Usuarios.objects.get(pk = id_usuario_request)
    
    perfil_usuario_existe = Perfil.objects.filter(id_usuario = id_usuario_request).exists()
    if perfil_usuario_existe:
        perfil_usuario = Perfil.objects.get(id_usuario = id_usuario_request)
    else:
        perfil_usuario = Perfil()
        perfil_usuario.id_usuario = usuario_bd
        #falta: averiguar porqué fallas
        perfil_usuario.fecha_nacimiento = request_form["fecha_nacimiento"]
    
    if( usuario_bd.nombre != usuario_request and nickname_existe_en_bd(request,usuario_request) == False and usuario_request!=''):
        usuario_bd.nombre = usuario_request
        usuario_bd.save()

    rol_request = request_form['rol']
    if(rol_request != usuario_bd.rol):
        usuario_bd.rol = rol_request
        usuario_bd.save()
    #falta: agregar return de errores
    email_request = request_form["email"]
    if(usuario_bd.email != email_request and email_existe_en_bd(request,email_request) == False and email_check(email_request)==True and email_request!=""):
        usuario_bd.email = email_request
        usuario_bd.save()
    password_request = request_form["password"]
    password_repeat_request = request_form["password_repeat"]
    if(password_request != "" and password_repeat_request != ""):
        if(password_validate(password_request) == True):
            if (compara_datos(password_request,password_repeat_request) == True):
                password_hasheada = make_password(password_request)
                usuario_bd.password = password_hasheada
                usuario_bd.save()
            else:
                return render(request, "errors/errorPass.html")
        else:
            return render(request, "errors/errorPass.html")
    else:
        return render(request, "errors/errorPass.html")           
            
                
                
    telefono_request = request_form["telefono"]
    if(telefono_request != perfil_usuario.telefono and telefono_request != "" and validar_telefono(request,telefono_request) == True and telefono_existe_en_bd(request,telefono_request) == False):
        perfil_usuario.telefono = telefono_request
        perfil_usuario.save()
    else:
        return render(request, "errors/errorTelefono.html")
        
    dni_request = request_form["DNI"]
    if(dni_request != perfil_usuario.dni and dni_request != ""):
        if(validar_dni(request,dni_request) == True and dni_existe_en_bd(request,dni_request) == False):
            perfil_usuario.dni = dni_request
            perfil_usuario.save()
        else:
            return render(request, "errors/errorDNI.html")
    else:
        return render(request, "errors/errorDNI.html")
    
    direccion_request = request_form["direccion"]
    if(direccion_request != perfil_usuario.direccion and direccion_request != ""):
        perfil_usuario.direccion = direccion_request
        perfil_usuario.save()
    else:
        return render(request, "errors/errorDireccion.html")
    
    fecha_nacimiento_request = request_form["fecha_nacimiento"]
    if(fecha_nacimiento_request != "" and fecha_nacimiento_request != perfil_usuario.fecha_nacimiento):
        if(comparar_fechas(fecha_nacimiento_request) == True):
            perfil_usuario.fecha_nacimiento = fecha_nacimiento_request
            perfil_usuario.save()
        else:
            return render(request, "errors/errorFecha.html")
            
    pais_request = request_form["pais"]
    
    if(pais_request != "" and pais_request != perfil_usuario.pais):
        perfil_usuario.pais = pais_request
        perfil_usuario.save()
    else:
        return render(request, "errors/errorRegion.html")

    if perfil_usuario:
        context = {
            'usuarioEditado' : usuario_bd.nombre
        }
        return render(request,"succesfully/usuarioEditado.html",context)


#controlador para eliminar el usuario que se pasa por url
def adminDeleteUsuario(request, id_usuario_eliminar):
    usuario = Usuarios.objects.get(pk = id_usuario_eliminar)
    usuario.delete()
    return administradorOperaciones(request)


#vista para la administración de productos
def administracionProductos(request):
    if request.COOKIES.get('id_usuario'):
        user_id = request.COOKIES.get('id_usuario')
        if es_admin(request,user_id):
            productos = Producto.objects.all()
            
            context = {
                'productos' : productos
            }
                
            return render(request,"admin/productos.html", context)
        else:
            return redirect("/login/")
    else:
        return redirect("/login/")
    
#método para eliminar el producto solicitado
def adminEliminarProducto(request,id_producto_eliminar):
    producto = Producto.objects.get(pk = id_producto_eliminar)
    producto.delete()
    return administracionProductos(request)


#métodod para editar el producto solicitado
def adminEditarProducto(request,id_producto_editar):
    producto = Producto.objects.get(pk = id_producto_editar)
    if request.COOKIES.get('id_usuario'):
        #si el uusuario es administrador, accederá al formulario de edición
        usuario_id = request.COOKIES.get('id_usuario')
        usuarios = Usuarios.objects.all()
        etiquetas = Etiqueta.objects.all().exclude(nombre = 'Hombre').exclude(nombre='Mujer').exclude(nombre='Niños')
        persona = Etiqueta.objects.all().exclude(nombre = 'Chaqueta').exclude(nombre = 'Pantalones').exclude(nombre = 'Camiseta').exclude(nombre='Sneakers')
        if es_admin(request,usuario_id):
            context = {
                'producto' : producto,
                'usuarios' : usuarios,
                'etiquetas' : etiquetas,
                'persona' : persona
            }
            
            return render(request,"admin/editarProducto.html",context)
    
#método que realiza los cambios en el producto
def editarProductoFormPost(request):
    requestForm = request.POST.dict()
    #foto_form = requestForm['foto_producto']
    #se deberá rellenar todos los campos
    if requestForm['nombre_producto'] !='' and requestForm['estado_producto'] !='' and requestForm['propietario_producto'] !=''  and requestForm['talla_producto'] !='' and requestForm['fecha_producto'] != '' and requestForm['descripcion_producto'] !='' and requestForm['etiqueta_producto']!='':
        id_producto_form = requestForm['id_producto']
        foto_form = request.FILES['foto_producto']
        producto = Producto.objects.filter(pk = id_producto_form)
        producto.update(nombre = requestForm['nombre_producto'])
        producto.update(estado = requestForm['estado_producto'])
        usuario = Usuarios.objects.get(id = requestForm['propietario_producto'])
        producto.update(propietario = usuario.id)
        producto.update(precio = requestForm['precio_producto'])
        fs = FileSystemStorage()
        fs.save(foto_form,foto_form)
        producto.update(foto = foto_form)
        producto.update(talla = requestForm['talla_producto'])
        producto.update(fecha_subida = requestForm['fecha_producto'])
        producto.update(descripcion = requestForm['descripcion_producto'])
        
        producto_foreign = Producto.objects.get(id = id_producto_form)
        etiqueta_foreign = Etiqueta.objects.get(id = requestForm['etiqueta_producto'])
        persona_foreign = Etiqueta.objects.get(id = requestForm['persona_producto'])
        producto_etiqueta = ProductoEtiqueta.objects.filter(id_producto = producto_foreign)
        producto_etiqueta.delete()
        new_producto_etiqueta = ProductoEtiqueta()
        new_producto_etiqueta.id_producto = producto_foreign
        new_producto_etiqueta.id_etiqueta = etiqueta_foreign
        new_producto_etiqueta.save()
        new_producto_persona = ProductoEtiqueta()
        new_producto_persona.id_producto = producto_foreign
        new_producto_persona.id_etiqueta = persona_foreign
        new_producto_persona.save()
        

        
        context = {
            'producto' : producto_foreign.nombre
        }
        return render(request,"succesfully/productoEditado.html",context)
        
        
    else:
        return render(request,"errors/errorProducto.html")
    
#vista para el formulario de crear producto
def adminRegistrarProducto(request):
    if request.COOKIES.get('id_usuario'):
        #si el uusuario es administrador, accederá al formulario de creación
        usuario_id = request.COOKIES.get('id_usuario')
        usuarios = Usuarios.objects.all()
        etiquetas = Etiqueta.objects.all().exclude(nombre = 'Hombre').exclude(nombre='Mujer').exclude(nombre='Niños')
        persona = Etiqueta.objects.all().exclude(nombre = 'Chaqueta').exclude(nombre = 'Pantalones').exclude(nombre = 'Camiseta').exclude(nombre='Sneakers')
        if es_admin(request,usuario_id):
            context = {
                'usuarios' : usuarios,
                'etiquetas' : etiquetas,
                'persona' : persona
            }
    return render(request,"admin/crearProducto.html",context)

#método para validar los datos y crear el producto
def adminRegisterProductoPOST(request):
    requestForm = request.POST.dict()
    #foto_form = requestForm['foto_producto']
    #se deberá rellenar todos los campos
    if requestForm['nombre_producto'] !='' and requestForm['estado_producto'] !='' and requestForm['propietario_producto'] !=''  and requestForm['talla_producto'] !='' and requestForm['fecha_producto'] != '' and requestForm['descripcion_producto'] !='' and requestForm['etiqueta_producto']!='':
        new_producto = Producto()
        new_producto.nombre = requestForm['nombre_producto']
        new_producto.estado = requestForm['estado_producto']
        new_producto.precio = requestForm['precio_producto']
        foto_form = request.FILES['foto_producto']
        fs = FileSystemStorage()
        fs.save(foto_form,foto_form)
        new_producto.foto = foto_form
        usuario = Usuarios.objects.get(pk = requestForm['propietario_producto'])
        new_producto.propietario = usuario
        new_producto.talla = requestForm['talla_producto']
        new_producto.fecha_subida = requestForm['fecha_producto']
        new_producto.descripcion = requestForm['descripcion_producto']
        new_producto.save()
        etiquetas = Etiqueta.objects.get(pk = requestForm['etiqueta_producto'])
        etiqueta_producto = ProductoEtiqueta()
        etiqueta_producto.id_etiqueta = etiquetas
        etiqueta_producto.id_producto = new_producto
        etiqueta_producto.save()
        
        return administracionProductos(request)


#vista que muestra las etiquetas y operaciones
def administracionEtiquetas(request):
    etiquetas = Etiqueta.objects.all()
    context = {
        'etiquetas' : etiquetas
    }
    return render(request,"admin/etiquetas.html",context)

#con este método se eliminará la etiqueta que se solicita
def adminEliminarEtiqueta(request,id_etiqueta):
    etiqueta = Etiqueta.objects.get(id = id_etiqueta)
    etiqueta.delete()
    return administracionEtiquetas(request)

#método que enviará al formulario de crear usuario
def adminRegistrarUsuario(request):
    return render(request,"admin/crearUsuario.html")




#---------------------------------------------------FINADMIN







#----------------------carrito------------------------#

#método para añadir un producto al carrito
def addProductoCart(request,id_producto):
    #recogemos la información de la sesión para guardar la cesta y el usuario
    if (request.COOKIES.get('id_usuario') and request.session):
        fecha = datetime.today().strftime('%Y-%m-%d')
        id_user = request.COOKIES.get('id_usuario') 
        usuario = Usuarios.objects.get(pk = id_user)
        carrito = request.session['cesta']
        id_carrito = request.session['id_cesta']
        
        producto_favorito_list = []
        cesta = Carrito.objects.filter(id_comprador = id_user, realizado = False)
        for prod in cesta:
            producto_favorito_list.append(prod.id_producto)
            
        #en caso de que el producto ya existe en la cesta, no se creará otro carrito
        #el usuario podrá añadir los favorito al carrito siempre y cuando no se encuentre ya en el carrito
        if id_producto in carrito and id_producto not in producto_favorito_list:
            print("ya está añadido")
        else:
            carrito.append(id_producto)
            request.session.modified = True
            productoAdded = Producto.objects.filter(id=id_producto)
            #guardmaos el carrito
            for id_producto in carrito:
                compra = Carrito()
                
                compra.id_comprador = usuario
                producto = Producto.objects.get(pk = id_producto)
                compra.id_producto = producto    
                compra.nombre_producto = producto.nombre
                compra.precio_producto = producto.precio
                compra.fecha = fecha
                compra.order_id = id_carrito
                compra.cantidad = 1
                compra.realizado = False
            compra.save()
            
            context = {
                'producto' : productoAdded
            }
            return render(request,"productoAdded.html",context)
        return redirect("/home/")
        #return mostrarCarrito(request)
    return redirect("/login/")    


#método para eliminar el producto del carrito
def eliminarProducto(request,producto_id):
    user_id = request.COOKIES.get('id_usuario')
    usuario = Usuarios.objects.get(id = user_id)
    
    carrito = Carrito.objects.get(id_producto = producto_id ,realizado = False, id_comprador = usuario)
    carrito.delete()
    return redirect("/mostrarCarrito/")   
    
#vista para mostrar la información del carrito en un template
def mostrarCarrito(request):
    #si el usuario está logeado, se guardará toda la información para enviársela al template de carrito.html
    #de lo contrario, se redirige al login
    if(request.COOKIES.get('id_usuario') and request.session):
        estaciones = Estacion.objects.all()
        usuario_id = request.COOKIES.get('id_usuario') 
        compra = Carrito.objects.filter(id_comprador = usuario_id, realizado = False)
        #producto = Producto.objects.filter(id = compra.id_producto)
        context = {
            'cesta' : compra,
            'estaciones' : estaciones
        }    
        if es_admin(request,usuario_id) == True:
            admin = Usuarios.objects.get(id = usuario_id)
            context['admin'] = admin
        return render(request,"carrito.html",context)
    return redirect("/login/")

#método para realizar la compra
#si el usuario tiene el perfil completado, se realizará la compra
#de lo contrario, deberá completarlo antes de comprar
def comprar(request):
    usuario_id = request.COOKIES.get('id_usuario')
    compra = Carrito.objects.filter(id_comprador = usuario_id, realizado = False)
    perfil = Perfil.objects.filter(id_usuario = usuario_id).exists()
    if perfil == True:
        compra.update(realizado = True)
        return render(request,"succesfully/comprado.html")
    else:
        return redirect("/usuario/perfil/")

#----------------------------------------FINcarrito


#-------------------------------------FAVORITOS
#método que añade los productos a favorito
def addProductoFavoritos(request,id_producto):
    #solo se podrá guardar en favoritos si el usuario está logeado
    if request.COOKIES.get('id_usuario') and request.session:
        #guardamso la información del producto y del usuario y creamos un nuevo registro en la tabla favoritos
        id_user = request.COOKIES.get('id_usuario')
        usuario = Usuarios.objects.get(id = id_user)
        favoritoList = []
        favoritos = Favoritos.objects.filter(id_usuario = id_user)
        for fav in favoritos:
            favoritoList.append(fav.id_producto.id)          
        if id_producto in favoritoList:
            print("ya está añadido")
            
        else:
            productoFavoritoAdded = Producto.objects.filter( id = id_producto)
            fecha = datetime.today().strftime('%Y-%m-%d')
            producto = Producto.objects.get(id = id_producto)
            new_favorito = Favoritos()
            new_favorito.id_producto = producto
            
            new_favorito.id_usuario = usuario
            new_favorito.fecha = fecha
            new_favorito.save()
            context = {
                'producto' : productoFavoritoAdded
            }
            
            return render(request,"favoritoAdded.html",context)
        return redirect("/home/")
    else:
        return redirect("/login/")


#método para eliminar un producto de favoritos
def eliminarProductoFavoritos(request,producto_id):
    if request.COOKIES.get('id_usuario'):
        id_usuario = request.COOKIES.get('id_usuario')
        favorito = Favoritos.objects.filter(id_usuario = id_usuario, id_producto = producto_id)
        favorito.delete()
        return redirect("/mostrarFavoritos/")    

#vista para mostrar los productos marcados como favoritos
def mostrarFavoritos(request):
    #guardamos toda la información para el template
    usuario_id = request.COOKIES.get('id_usuario')
    usuario_existe = Usuarios.objects.filter(id = usuario_id).exists()
    estaciones = Estacion.objects.all()
    etiquetas_categoría = Etiqueta.objects.all().exclude(nombre = "Chaqueta").exclude(nombre = "Camiseta").exclude(nombre = "Pantalones").exclude(nombre="Sneakers")
    etiquetas_prendas = Etiqueta.objects.all().exclude(nombre="Hombre").exclude(nombre="Mujer").exclude(nombre="Niños")
    #si el usuario existe se mostrá toda la información de los favoritos
    if usuario_existe:
        ids_productos = []
        productosList = []
        favoritos = Favoritos.objects.filter(id_usuario = usuario_id)
        for fav in favoritos:
            ids_productos.append(fav.id_producto.id)
        
        for id_prod in ids_productos:
            productos = Producto.objects.filter(id = id_prod)
            for prod in productos:
                diccionario = {}
                diccionario['id'] = prod.id
                diccionario['nombre'] = prod.nombre
                diccionario['precio'] = prod.precio
                diccionario['descripcion'] = prod.descripcion
                diccionario['foto'] = prod.foto
                productosList.append(diccionario)
    
        context = {
            'productos' : productosList,
            'estaciones' : estaciones,
            'etiquetas' : etiquetas_categoría,
            'prendas' : etiquetas_prendas
        }
        if es_admin(request,usuario_id):
            admin = Usuarios.objects.get(pk = usuario_id)
            context['admin'] = admin
        
        return render(request,"mostrarFavoritos.html",context)