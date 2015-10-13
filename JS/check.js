

/*function setFocusToTextBox(){
    document.getElementById("usuario").focus();
}*/


function compruebaCI(){ 
    if (document.f1.ci.value.length <6 ){ 
        //si era la cadena vacía es que no era válido. Lo aviso 
        alert ("La cedula debe ser de almenos 6 caracteres");
        //selecciono el texto 
        document.f1.ci.select(); 
        //coloco otra vez el foco 
        document.f1.ci.focus(); 
    }
}
