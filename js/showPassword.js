//Mostrar contraseñas en formularios
function mouseDown(opcion, elemento) {
    var x = document.getElementById(opcion);
    x.type = "text";
    $(elemento).toggleClass("fa-eye fa-eye-slash");
}
function mouseUp(opcion, elemento) {
    var x = document.getElementById(opcion);
    x.type = "password";
    $(elemento).toggleClass("fa-eye-slash fa-eye");
}
// End mostrar contraseñas en formularios