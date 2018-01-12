<?php
require_once 'controller/UsuarioController.php';;
session_start();
if(!isset($_SESSION['idusuario']) && !isset($_POST['username'])){
    login();
}elseif (isset ($_GET['controller'])) {
   switch ($_GET['controller']) {
    case 'usuario':       
           $controller = new UsuarioController();
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
function login(){
    header("Location: ./view/loginView.php");
}
