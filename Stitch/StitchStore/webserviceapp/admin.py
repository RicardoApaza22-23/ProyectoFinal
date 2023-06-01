from django.contrib import admin
from .models import Usuarios, Producto, Perfil,Carrito,Estacion,EstacionProducto,Etiqueta,ProductoEtiqueta,Favoritos
# Register your models here.
admin.site.register(Usuarios)
admin.site.register(Producto)
admin.site.register(Perfil)
admin.site.register(Carrito)
admin.site.register(Estacion)
admin.site.register(EstacionProducto)
admin.site.register(Etiqueta)
admin.site.register(ProductoEtiqueta)
admin.site.register(Favoritos)