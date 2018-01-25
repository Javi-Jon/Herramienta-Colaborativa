<?php
require_once 'controller/UsuarioController.php';
require_once 'controller/ProyectoController.php';
require_once './controller/TareasController.php';
require_once 'controller/ControllerGenerico.php';
require_once './controller/MuroController.php';
require_once 'controller/MensajesController.php';
session_start();
if(!isset($_SESSION['idusuario']) && !isset($_POST['username'])){
    loginView();
}elseif (isset ($_GET['controller']) || isset($_SESSION['idusuario'])) {
   switch (@$_GET['controller']) {
    case 'usuario':       
           $controller = new UsuarioController();
          action($controller);       
        break;
    case 'proyecto':       
           $controller = new ProyectoController();
          action($controller);       
        break;
    case 'tareas':       
           $controller = new TareasController();
          action($controller);       
        break;
    case 'muro':
            $controller=new MuroController();
             action($controller);  
        break;
    case 'mensaje':
            $controller=new MensajesController();
             action($controller);  
        break;
    
    default:
        index();
        break;       
   }
} else {
  
}
function action($objController) {    
    $objController->run($_GET['action']);
}
function loginView(){
   $ctrl=new Controller();
   $ctrl->view('login', ['prueba'=>'dasda']);
    
}
function index(){
    $ctrl=new Controller();
    $usuario=new UsuarioController();
     $proyectos=$usuario->getInfoUsuario($_SESSION['idusuario']);
    $ctrl->view('index', ['proyectos'=>$proyectos]);
}