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
            case 'rbyuser':
                $this->buscarByUsername();                
                break;
            case 'rself':
                $this->buscarSelf();
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
            $this->view('index',[]);
        }else{
            echo 'login incorrecto';
        }
        
    }
    function buscarByUsername(){
        $user=new Usuario();
        $user->setUsername($_POST['username']);
        $ausuario=$user->getUsuarioByUsername();
        echo json_encode($ausuario);              
    }
    function buscarSelf(){
        $user=new Usuario();
        $user->setId($_SESSION['idusuario']);        
        $ausuario=$user->getUsuarioByID();
        echo json_encode($ausuario);
//        return $ausuario;
        
        
    }
    
}
