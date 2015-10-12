

/*function setFocusToTextBox(){
    document.getElementById("usuario").focus();
}*/


function compruebaPassword(){ 
    if (document.f1.password.value == "" || document.f1.password.value.length <2 ){ 
        //si era la cadena vacía es que no era válido. Lo aviso 
        alert ("La password debe contener almenos 2 caracteres!")         
        document.f1.password.select() 
        //coloco otra vez el foco 
        document.f1.password.focus() 
    }
}

function compruebaPasswordNueva(){ 
    if (document.f1.passwordNueva.value == "" || document.f1.passwordNueva.value.length <2 ){ 
        //si era la cadena vacía es que no era válido. Lo aviso 
        alert ("La password debe contener almenos 2 caracteres!")         
        document.f1.passwordNueva.select() 
        //coloco otra vez el foco 
        document.f1.passwordNueva.focus() 
    }
}

function compruebaUsuario(){ 
    if (document.f1.usuario.value.length <2 ){ 
        //si era la cadena vacía es que no era válido. Lo aviso 
        alert ("El usuario debe ser de almenos 2 caracteres") 
        //selecciono el texto 
        document.f1.usuario.select() 
        //coloco otra vez el foco 
        document.f1.usuario.focus() 
    }
}
