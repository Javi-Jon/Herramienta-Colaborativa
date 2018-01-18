<?php
require_once 'controller/UsuarioController.php';
require_once 'controller/ProyectoController.php';
require_once './controller/TareasController.php';
session_start();
if(!isset($_SESSION['idusuario']) && !isset($_POST['username'])){
    loginView();
}elseif (isset ($_GET['controller']) || isset($_SESSION['idusuario'])) {
   switch ($_GET['controller']) {
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
    header("Location: ./view/loginView.php");
}
function index(){
    header("Location: view/index.html");
}