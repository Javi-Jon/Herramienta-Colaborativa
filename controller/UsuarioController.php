<?php
require_once 'ControllerGenerico.php';
require_once __DIR__ .'/../Modelo/Usuario.php';
require_once 'ProyectoController.php';
require_once 'TareasController.php';
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
          $proyectos=$this->getInfoUsuario($_SESSION['idusuario']);
            $this->view('index',['proyectos'=>$proyectos]);
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
    function getInfoUsuario($idusuario){
         $pc=new ProyectoController();
          $proyectos=  $pc->getProyectosUsuario($idusuario);
          
          $tc=new TareasController();
          foreach($proyectos as &$proyecto){
            $numeros=$tc->getProgreso($proyecto['id']);
            if($numeros[0]->total==0){
                $proyecto['prog'] = 0;
                
            } else {
                $proyecto['prog']= round($numeros[1]->total/$numeros[0]->total*100);

            }
           
          }
          unset($proyecto);
         
          return $proyectos;
    }
    
}
