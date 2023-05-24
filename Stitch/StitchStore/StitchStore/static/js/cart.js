//carrito 
//botones de cada add de cada producto  
var botones = document.getElementsByClassName("add-cart-btn")
for(var i = 0; i < botones.length;i++){
    botones[i].addEventListener("click",function(){
        //conseguimos el ID de cada producto que añadimos
        var productoID = this.dataset.producto
        var action = this.dataset.action
        console.log('productoID:',action)
        console.log('user:',user)
        if(user == "AnonymousUser"){
            console.log("usuario no identificado")
        }else{
            orderPOST(productoID,action)
        }
        

    })
}
//updateUserOrder
function orderPOST(productoID,action){
    var url = '/carrito/';
    var data = {"id_producto": productoID, "orden" : action};
    
    fetch(url, {
      method: 'POST', // or 'PUT'
      body: JSON.stringify(data), // data can be `string` or {object}!
      headers:{
        'Content-Type': 'application/json',
        'X-CSRFToken' : csrftoken
      }
    }).then((response) => {
        return response.json()
    })
    .then((data) => {
        console.log('data: ' , data)
    })

}

