<?php
require_once 'ControllerGenerico.php';
require_once __DIR__ .'/../Modelo/Usuario.php';
class UsuarioController extends Controller{
      
    function run($action){
        switch ($action) {
            case 'c':
                $this->registrar();
                break;
            case 'log':
                $this->logearse();
                break;
            default:
                break;
        }
    }
    function registrar() {
        $usuario=new Usuario();
        $usuario->setUsername($_POST['username']);
        $usuario->setPassword($_POST['password']);
        $usuario->setTipo(0);
        $usuario->setFullname($_POST['fullname']);
        $usuario->setCorreo($_POST['correo']);
        $usuario->registrar();
    }
    function logearse() {
        $usuario=new Usuario();
        $usuario->setUsername($_POST['username']);
        $usuario->setPassword($_POST['password']);        
        if($usuario->login()){
            header("Location: view/index.html");
        }
       
        
    }
}
