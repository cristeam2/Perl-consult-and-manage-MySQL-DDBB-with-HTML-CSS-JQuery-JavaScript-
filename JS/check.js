

/*function setFocusToTextBox(){
    document.getElementById("usuario").focus();
}*/



function compruebaUsuario(){ 
    if (document.getElementById("nombre").value.length <2){
        //si era la cadena vacía es que no era válido. Lo aviso 
        alert("El usuario debe ser de almenos 2 caracteres") ;
        //selecciono el texto 
        document.getElementById("nombre").select();
        //coloco otra vez el foco 
        document.getElementById("nombre").focus();
    }
}
