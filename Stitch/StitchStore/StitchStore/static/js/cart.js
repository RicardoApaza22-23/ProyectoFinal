//Carrito
let carritoIcon = document.querySelector(".cart-icon")
let carrito = document.querySelector(".cart")
let cerrarCarrito = document.querySelector("#cerrar-cart")
const carrito_icon = document.querySelector('#cart-icon')
let cesta = []
//abrir ventana carrito
carritoIcon.onclick = () =>{
    carrito.classList.add("active");
};
//cerra ventana carrito
cerrarCarrito.onclick = () =>{
    carrito.classList.remove("active");
};

//guardar la cesta en el navegador
document.addEventListener('DOMContentLoaded', () => {
    cesta = JSON.parse(localStorage.getItem('cesta')) 

    mostrarCarrito()
})

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
// function getTotal(){
//     var carritoContenido = document.getElementsByClassName("contenido-cart")[0]
//     var carritoBoxs = carritoContenido.getElementsByClassName("box-cart")
//     var total = 0;
//     for(var a = 0;a<carritoBoxs.length; a++){
//         var carritoBox = carritoBoxs[a]
//         var precios = carritoBox.getElementsByClassName("precio-producto")[0]
//         var cantidades = carritoBox.getElementsByClassName("cantidadProducto-cart")[0]
//         var precio = parseFloat(precios.innerText.replace("€",""))
//         var cantidad = cantidades.value
//         total = total + precios * cantidad
//         total = Math.round(total * 100) / 100

//         document.getElementsByClassName("total-precio")[0].innerText= "€" + total
//     }
// }

//guardamos los datos de los productos
function saveToCart(event){
    var submit = event.target
    var addProducto = submit.parentElement
    var titulo = addProducto.getElementsByClassName("titulo-producto")[0].innerText;
    var precio = addProducto.getElementsByClassName("precio-producto")[0].innerText;
    var id_producto = addProducto.getElementsByClassName("id-producto")[0].value
    var productoImagen = addProducto.getElementsByClassName("fotoProducto")[0].src;
    //const {titulo,precio,id_producto,productoImagen} = item;
    const item = {
        id : id_producto,
        'titulo' : titulo,
        'precio' : precio,
        'imagen' : productoImagen
    };
    
    //cesta.push(titulo,precio,productoImagen,id_producto);
    //var item2 = ["asdasd","213123"]
    cesta.push(item)
    console.log(cesta);
    
    //mostrarCarrito(titulo,precio,productoImagen,id_producto);
    mostrarCarrito()
    //getTotal();

}




//ADD TO CART
function mostrarCarrito(){
    // var ventanaCarrito = document.createElement("div")
    // var carritoItems = document.getElementsByClassName("contenido-cart")[0]
    // var carritoItemsTitulos = carritoItems.getElementsByClassName("titulo-cart")

    // for(a=0;a<carritoItemsTitulos.length;a++){
    //     if(carritoItemsTitulos[a].innerText !== titulo){
      
    // }else{
    //     alert("El producto ya ha sido añadido al carrito")        
    //     return
    // }
    //}
    
    // cesta.push(id_producto)
    // console.log(cesta)
    const box_cart = document.querySelector('.cart .box-cart')
    box_cart.innerHTML = ''
    cesta.forEach((producto) => {
        const {id, titulo,precio,imagen} = producto
        
    box_cart.innerHTML += `
    
    <img class="fotoProducto-cart" src="${imagen}" alt="fotoProducto" />
                    
    <div class="detalles-box-cart">
    <div class="titulo-cart">${titulo}</div>
    <div class="precio-cart">${precio}</div>
    <input type="hidden" value="${id}" class="id_producto-cart">
    <input type="number" value="1" class="cantidadProducto-cart">
    </div>
        <i class="fa-solid fa-trash eliminarProducto-cart"></i>
        <button onclick="eliminarProductoId(${id})" > Eliminar</button>
        
        
    </div>
        <button onclick="vaciarCarrito()">Vaciar Carrito</button>
        <button onclick="procesarCompra()">Comprar</a></button>
        ` });
        //carrito_icon.textContent = cesta.length
        //


        // ventanaCarrito.innerHTML = carritoContenidoCrear
        // carritoItems.append(ventanaCarrito)
        // ventanaCarrito.getElementsByClassName('eliminarProducto-cart')[0].addEventListener("click",eliminarProducto)
        // ventanaCarrito.getElementsByClassName("cantidadProducto-cart")[0].addEventListener("change",setCantidadDefault)
        //getTotal()   
        guardarCesta()

    }

function eliminarProductoId(id){
    var prod_id = id.toString();
    cesta = cesta.filter(cesta => cesta.id !== prod_id );
    //document.cookie="carrito="+cesta;
    //console.log(car)
    mostrarCarrito()
}

//seteat una cookie para mantener el carrito en el browser
function guardarCesta(){
    document.cookie = "carrito="+JSON.stringify(cesta)
    localStorage.setItem("cesta",JSON.stringify(cesta))
}



function vaciarCarrito(){
    cesta = []
    guardarCesta()
    mostrarCarrito()
}

function procesarCompra(){
    var url = "/carrito/"
    //
    fetch(url,{
        method : 'POST',
        headers : {
            'Content-Type':'application/json',
            'X-CSRFToken': csrftoken
        },
        body : JSON.stringify({"carrito": cesta})
        
    }).then((data) => {
        location.reload()
    })
    
}



//precio total
function setCantidadDefault(event){
    var precio = event.target
    if(isNaN(precio.value) || precio.value<=0){
        precio.value = 1;
    }
    //getTotal()
}
//eliminar producto del carrito
function eliminarProducto(event){
var botonClicked = event.target
alert(botonClicked.parentElement.getElementsByClassName("id_producto-cart").innerHTML)
botonClicked.parentElement.remove();
//getTotal()          

}