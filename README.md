# STITCH'S STORE
Repositorio que aloja el desarrollo de mi proyecto de fin de ciclo
Stitch's store es un proyecto sobre una tienda online.

## Tabla de Contenidos

- [Descripción](#descripción)
- [Características](#características)
- [Requisitos](#requisitos)
- [Instalación](#instalación)
- [Uso](#uso)
- [Contribución](#contribución)
- [Licencia](#licencia)
- [Contacto](#contacto)

## Descripción

Stitch's sotre es un ecommerce que tiene una temática de la película de Lilo y Stitch, donde cualquier persona puede accede mediante una cuenta (login) o registrándose en el apartado de registro.
Este proyecto alberga diferentes tipos de ropa (pantalones, sneakers, chaquetas...) que tú puedes comprar o también puedes subir tus productos para venderlos.
Por el momento se trata de una tienda de prendas de ropa, pero en el futuro se puede ampliar el repertorio añadiendo todo tipo de productos.

## Características
#### Sistema de autenticación 
#### Sistema de administrador
#### Sistema de compra
#### Sistema de venta

## Requisitos

#### Framework: Django
#### Lenguaje de programación: Python
#### Librerías: se usan librerías propias de Django

## Instalación

#### Instalar Python
#### instalar Django
apt install python3-pip python3-django
#### Crear el proyecto en Django
django-admin startproject Stitch
#### Crear un entorno virtual para el proyecto:
python -m venv .venv
#### Base de datos
Realizamos la migraciones de la base de datos
python3 manage.py makemigration
python3 manage.py migrate
#### Ejecutar el servidor
python3 manage.py runserver 0.0.0.0:8000

## Uso
#### HomePage
El usuario podrá navegar por cualquier parte de la tienda sin necesidad de logearse o registrarse.
#### Login
Para que el usuario pueda agregar algún elemento al carrito, o añadir a favoritos la página la redirigirá al login, donde se podrá dar de alta.
#### Register
Si el usuario no tiene cuenta, se podrá crear una en el apartado de registro
#### Compra
El cliente podrá guardar en el carrito o en la lista de favoritos cualquier elemento de la tienda, estos elementos no se podrán repetir en el carrito ni en la lista de favoritos. 
En el encabezado hay un icono de favorito y de carrito. El icono de carrito te llevará a realizar la compra, y el icono de favoritos mostrará por pantalla los productos añadidos a la lista
#### Administrador
El usuario que tenga superpoderes podrá gestionar los productos, los usuarios, las etiquetas y más adelante se podrán añadir más poderes.
Sobre estos elementos el administrador tiene poderes de edición, eliminar y creación.

## Contribución
¡Gracias por considerar contribuir a nuestro proyecto! Apreciamos cualquier tipo de contribución, ya sea en forma de correcciones de errores, nuevas características, mejoras en la documentación o pruebas adicionales. Para asegurarnos de que las contribuciones sean efectivas y bien integradas, te pedimos seguir el siguiente proceso:
   #### Haz un fork de este repositorio en GitHub
   #### Clonar el repositorio
   git clone htttps://github.com/RicardoApaza/ProyectoFinal.git
   #### Crear una rama independiente para tú contribución
   git checkout -b mi-contribución
   #### Realizar commits 
   git commit -m "tus cambios hechos" /elarchivo.modificado
   #### Subir los cambios
   git push origin mi-contribución
   
## Licencia

Este proyecto se encuentra bajo la Licencia MIT.
Si decides utilizar este proyecto, te animamos a que añadas una mención o enlace a este repositorio en tu documentación o en cualquier lugar donde sea apropiado.


## Contacto
Email: rapazac22@fpcoruna.afundacion.org

