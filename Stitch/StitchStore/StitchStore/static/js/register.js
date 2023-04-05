//---------------------cambiar icono en el input de contraseña----------------
//constante recoje todos los iconos con este nombre
const ojoIcono = document.querySelectorAll(".mostrar-ocultar");
//cada vez que le demos click al icono cambia el icono 
ojoIcono.forEach(ojoIcono => {
    ojoIcono.addEventListener("click", () => {
        //recogemos los input
        const pass_input= ojoIcono.parentElement.querySelector("input");
        //si ese uinput es de tipo contraseña
        if(pass_input.type === "password"){
            //el icono cambia
            ojoIcono.classList.replace("bxs-show","bxs-hide");
            //y se muestra la contraseña
            return pass_input.type = "text";    
        }
        //si se vuelve a dar click, cambia el icono y la contraseña se pone tipo password
        ojoIcono.classList.replace("bxs-hide","bxs-show")
        return pass_input.type="password";
    
    })
});

