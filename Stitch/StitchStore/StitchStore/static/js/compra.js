// obetner el precio total de los productos dinámicamente
function getPrecioTotal(){
    var productos = document.getElementsByClassName('producto-box');
    var precioTotal = 0;
    for(var i = 0; i<productos.length; i++){
        var precioProducto = parseFloat(productos[i].getElementsByClassName('precio-producto')[0].innerText);
        var cantidad = parseInt(productos[i].querySelector('input[name="cantidad"]').value);
        var precioProductoTotal = precioProducto * cantidad;
        precioTotal += precioProductoTotal;
        
    } 
    
    var precioTotalItem = document.getElementById('precio-total');
    precioTotalItem.innerHTML = precioTotal.toFixed(2) + '€';
    var precioTotalInput = document.getElementById('precio-total-input');
    precioTotalInput.value = precioTotal.toFixed(2);
   
}
getPrecioTotal()
var camposCantidad = document.querySelectorAll('input[name="cantidad"]');
camposCantidad.forEach(function(input){
    input.addEventListener('input',function() {
        getPrecioTotal();
    });
});