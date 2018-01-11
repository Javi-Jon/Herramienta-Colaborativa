<?php

session_start();
if(!isset($_SESSION['idusuario'])){
    login();
}elseif (isset ($_GET['controller'])) {
   switch ($_GET['controller']) {
    case'':
        $controller = new VinoController();
        action($controller);       
        break;
    default:
        index();
        break;       
   }
} else {
index();    
}
function action($objController) {
    $objController->run($_GET['action']);
}

