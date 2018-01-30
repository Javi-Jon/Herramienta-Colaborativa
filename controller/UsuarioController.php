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
            case 'rcomp':
                $this->buscarCompaneros();
                break;
            case 'confirm':
                $this->confirmarCuenta();
                break;
            case 'logout':
                unset($_SESSION['idusuario']);
                header("Location: index.php");
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
            index();
//          $proyectos=$this->getInfoUsuario($_SESSION['idusuario']);
//            $this->view('index',['proyectos'=>$proyectos,'yo'=>$_SESSION['idusuario']]);
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
          $usuario=new Usuario();
          $usuario->setId($idusuario);
         $datosusuario= $usuario->getUsuarioByID();
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
         
          return ["proyectos"=>$proyectos,"usuario"=>$datosusuario];
    }
    function buscarCompaneros(){
        $usuario=new Usuario();
        $usuario->setId($_SESSION['idusuario']);
        $compas=$usuario->getCompaneros();
        echo json_encode($compas);        
    }
    function confirmarCuenta(){
        $usuario=new Usuario();
        $usuario->setId($_GET['id']);
        $filas=$usuario->confirmAcc();
        if($filas==1){
            $_SESSION['idusuario']=$_GET['id'];
      
            header('Location:index.php');
      
        }
    }
    
}
