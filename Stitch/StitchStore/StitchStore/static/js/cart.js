//Carrito
let carritoIcon = document.querySelector(".cart-icon")
let carrito = document.querySelector(".cart")
let cerrarCarrito = document.querySelector("#cerrar-cart")
//abrir ventana carrito
carritoIcon.onclick = () =>{
    carrito.classList.add("active");
};
//cerra ventana carrito
cerrarCarrito.onclick = () =>{
    carrito.classList.remove("active");
};


if(document.readyState == "loading"){
    document.addEventListener("DOMContentLoaded",botonesCarrito)
}else{
    botonesCarrito();
}

function botonesCarrito(){
    var eliminarCartButtons = document.getElementsByClassName('eliminarProducto-cart')
    //console.log(eliminarCartButtons)
    for(var i=0;i<eliminarCartButtons.length;i++){
        var boton = eliminarCartButtons[i]
        boton.addEventListener('click', eliminarProducto)
    }
    var cantidades = document.getElementsByClassName("cantidadProducto-cart")
    for(var a = 0; a<cantidades.length;a++){
        var cantidad = cantidades[a]
        cantidad.addEventListener("change",setCantidadDefault)
    }
    var addCart = document.getElementsByClassName("add-cart")
    for(e=0;e<addCart.length;e++){
        var boton = addCart[e]
        boton.addEventListener("click",saveToCart)
    }
}
//total
function getTotal(){
    var carritoContenido = document.getElementsByClassName("contenido-cart")[0]
    var carritoBoxs = carritoContenido.getElementsByClassName("box-cart")
    var total = 0;
    for(var a = 0;a<carritoBoxs.length; a++){
        var carritoBox = carritoBoxs[a]
        var precios = carritoBox.getElementsByClassName("precio-producto")[0]
        var cantidades = carritoBox.getElementsByClassName("cantidadProducto-cart")[0]
        var precio = parseFloat(precios.innerText.replace("€",""))
        var cantidad = cantidades.value
        total = total + precio * cantidad
        total = Math.round(total * 100) / 100

        document.getElementsByClassName("total-precio")[0].innerText= "€" + total
    }
}
//guardamos los datos de los productos
function saveToCart(event){
    var submit = event.target
    var addProducto = submit.parentElement
    var titulo = addProducto.getElementsByClassName("titulo-producto")[0].innerText
    var precio = addProducto.getElementsByClassName("precio-producto")[0].innerText
    var productoImagen = addProducto.getElementsByClassName("fotoProducto")[0].src
    addProductToCartAction(titulo,precio,productoImagen)
    getTotal()
    //console.log(titulo,precio,productoImagen)
}

//ADD TO CART
function addProductToCartAction(titulo,precio,productoImagen){
    var ventanaCarrito = document.createElement("div")
    var carritoItems = document.getElementsByClassName("contenido-cart")[0]
    var carritoItemsTitulos = carritoItems.getElementsByClassName("titulo-cart")
    for(a=0;a<carritoItemsTitulos.length;a++){
        if(carritoItemsTitulos[a].innerText == titulo){
            alert("El producto ya ha sido añadido al carrito")
            return
        }
    }
    var carritoContenidoCrear = `
    <img class="fotoProducto-cart" src="${productoImagen}" alt="fotoProducto" />
                    
    <div class="detalles-box-cart">
    <div class="titulo-cart">${titulo}</div>
    <div class="precio-cart">${precio}</div>
    <input type="number" value="1" class="cantidadProducto-cart">
    </div>
        <i class="fa-solid fa-trash eliminarProducto-cart"></i>
    </div>
        `
        ventanaCarrito.innerHTML = carritoContenidoCrear
        carritoItems.append(ventanaCarrito)
        ventanaCarrito.getElementsByClassName('eliminarProducto-cart')[0].addEventListener("click",eliminarProducto)
        ventanaCarrito.getElementsByClassName("cantidadProducto-cart")[0].addEventListener("change",setCantidadDefault)
        getTotal()
    }


//precio total
function setCantidadDefault(event){
    var precio = event.target
    if(isNaN(precio.value) || precio.value<=0){
        precio.value = 1;
    }
    getTotal()
}
//eliminar producto del carrito
function eliminarProducto(event){
var botonClicked = event.target
botonClicked.parentElement.remove();
getTotal()
}

