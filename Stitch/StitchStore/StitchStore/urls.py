"""StitchStore URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from webserviceapp import views
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [
    path('admin/', admin.site.urls),
    path('login/',views.login),
    path('loginPOST/', views.loginPOST),
    path('register/', views.register),
    path('registerPOST/', views.registerPOST),
    path('home/', views.goHome),
    path('logOut/', views.LogOut),
    path('usuario/perfil/',views.perfilForm),
    path('usuario/perfil/PerfilFormPost/', views.perfilFormPost),
    path('usuario/perfil/', views.perfilFormPost),
    path('adminController/',views.administradorOperaciones),
    path('adminController/editar/<int:id_usuario_editar>/', views.adminEditarUsuario),
    path('adminController/editarProducto/<int:id_producto_editar>', views.adminEditarProducto),
    path('usuarios/editarPost/',views.editarUsuarioFormPost),
    path('adminController/eliminar/<int:id_usuario_eliminar>',views.adminDeleteUsuario),
    path('adminController/eliminarProducto/<int:id_producto_eliminar>',views.adminEliminarProducto),
    path('productos/editarPost/',views.editarProductoFormPost),
    path('addProduct/<int:id_producto>', views.addProductoCart),
    path('addFavoritos/<int:id_producto>', views.addProductoFavoritos),
    path('eliminarProducto/<int:producto_id>',views.eliminarProducto),
    path('eliminarFavoritos/<int:producto_id>', views.eliminarProductoFavoritos),
    path('mostrarCarrito/',views.mostrarCarrito),
    path('mostrarFavoritos/',views.mostrarFavoritos),
    path('comprar/',views.comprar),
    path('home/estaciones/<estacion_nombre>',views.mostrarProductosEstacion),
    path('home/etiquetas/<etiqueta_nombre>',views.mostrarProductosEtiquetas),
    path('adminController/administracionProductos',views.administracionProductos),
    path('adminController/administracionEtiquetas',views.administracionEtiquetas),
    path('adminController/eliminarEtiqueta/<int:id_etiqueta>',views.adminEliminarEtiqueta),
    path('adminController/registrarUsuario/', views.adminRegistrarUsuario),
    path('adminController/registrarUsuario/registerPOST/',views.registerPOST),
    path('adminController/registrarProducto/',views.adminRegistrarProducto),
    path('adminController/registrarProducto/crearProductoPOST/',views.adminRegisterProductoPOST)
    
    
    #path('home/prendas/<prenda_nombre>')
] + static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
