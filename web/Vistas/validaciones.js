/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function validateUsuarios(){
var Usr = document.getElementById("inputUsr").value;
var Cont = document.getElementById("inputCont").value;
var Tele = document.getElementById("inputTele").value;
var mail = document.getElementById("inputCorreo").value;
    
var valido = true;
    if(!Usuario(Usr)){
        document.getElementById("errorUsr").innerHTML="Solo alfanumérico. Minimo 6.";
        document.getElementById("logo").scrollIntoView(true);
        valido = false;
    }else{
        document.getElementById("errorUsr").innerHTML="";
    } 
    
    if(!Contrasena(Cont)){
        document.getElementById("errorCont").innerHTML="Una letra mayuscula y minuscula. Un numero. Minimo 8.";
        document.getElementById("logo").scrollIntoView(true);
        valido = false;
    }else{
        document.getElementById("errorCont").innerHTML="";
    }
    
    if(!Telefono(Tele)){
        document.getElementById("errorTele").innerHTML="8 digitos. Numeros Locales.";
        document.getElementById("inputCont").scrollIntoView(true);
        valido = false;
    }else{
        document.getElementById("errorTele").innerHTML="";
    }
    
    
    if(!Correo(mail)){
        document.getElementById("errorCorreo").innerHTML="Debe tener un dominio.";
        document.getElementById("inputTele").scrollIntoView(true);
        valido = false;
    }else{
        document.getElementById("errorCorreo").innerHTML="";
    }
    
    
    return valido;
}

function validateForm(){
var nombre = document.getElementById("inputNombre").value;
var apellido = document.getElementById("inputApellido").value;
var valido = true;
    if(!Nombres(apellido)){
        document.getElementById("errorApellido").innerHTML="Solo letras. Minimo 3 por nombre. Máximo 1 espacio";
        document.getElementById("logo").scrollIntoView(true);
        valido = false;
    }else{
        document.getElementById("errorApellido").innerHTML="";
    }    
    if(!Nombres(nombre)){
        document.getElementById("errorNombre").innerHTML="Solo letras. Minimo 3 por nombre. Máximo 1 espacio";        
        document.getElementById("logo").scrollIntoView(true);
        valido = false;
    }else{
        document.getElementById("errorNombre").innerHTML="";
    }    

    
    return valido;
}

function Nombres(texto){
    if(/^([a-z|A-Z|áíóúñéÑÉ]{3,})+(?: [a-z|A-Z|áíóúñéÑÉ]+)*$/.test(texto.toString())){        
        return true;
    }else{
        return false;
    }
    
    return true;
}

function Usuario(texto){
    if(/^([a-z|A-Z|áíóúñéÑÉ|0-9]{6,})$/.test(texto.toString())){        
        return true;
    }else{
        return false;
    }
    
    return true;
}

function Contrasena(texto){
    if(/(?=^.{7,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/.test(texto.toString())){        
        return true;
    }else{
        return false;
    }
    
    return true;
}

function Telefono(texto){
    if(/^[23789]+([0-9]{7})$/.test(texto.toString())){        
        return true;
    }else{
        return false;
    }
    
    return true;
}

function Correo(texto){
    /*
    if(/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/.test(texto.toString())){        
        return true;
    }else{
        return false;
    }
    
    return true;
    */
}

