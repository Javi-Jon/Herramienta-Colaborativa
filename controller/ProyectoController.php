<?php
require_once 'ControllerGenerico.php';
require_once __DIR__ .'/../Modelo/Proyecto.php';
require_once 'TareasController.php';
class ProyectoController extends Controller{
     
    function run($action){
        switch ($action) {
            case 'c':
                $this->crearProyecto();
                break;
            case 'ap':
                $this->anadirParticipacion();
            break;
            case 'dp':
                $this->deleteParticipacion();
                break;
//            case 'pp':
//                $this->getProyectosUsuario($_GET['asd']);
//                break;
            case 'vp':
                $this->verProyecto();
                break;
            default:
                break;
        }
    }
    function crearProyecto(){
        $proyecto=new Proyecto();
        $proyecto->setNombre($_POST['nombre']);
        $proyecto->setDescripcion($_POST['descripcion']);
        $proyecto->setCreador($_SESSION['idusuario']);
        
       $id= $proyecto->nuevoProyecto();
       echo $id;
    }
    function anadirParticipacion(){
        $proyecto=new Proyecto();
        $p=new Usuario();
        $p->setUsername($_POST['username']);
        $persona=$p->getUsuarioByUsername($_POST['username']);
        if($persona==''){
            echo'error';
        } else {
        $proyecto->setId($_GET['idproyecto']);
        
      $idParticipacion=$proyecto->anadirParticipante($persona->id);   
      echo json_encode([$persona,"participacionID"=>$idParticipacion]);
        }
    
        
    }
    function buscarParticipantes() {
        $proyecto=new Proyecto();
        $proyecto->setId($_POST['idproyecto']);
        $participantes=$proyecto->getParticipaciones();
        
       echo json_encode($participantes);
        
    }
    function deleteParticipacion() {
        $proyecto=new Proyecto();
       $filas= $proyecto->deleteParti($_GET['idpart']);
       
       echo $filas;
        
    }
    function getProyectosUsuario($idusuario) {
         $proyecto=new Proyecto();
        $proyectos= $proyecto->getProyectosByUsuario($idusuario);
        
        return $proyectos;
    }
    function verProyecto() {
        $p=new Proyecto();
        $p->setId($_GET['id']);
       $proyecto= $p->getProyectoById();
       $participantes=$p->getParticipaciones();
      $tc=new TareasController();
     $tareas= $tc->getTareasDeProyecto($p->getId());
       $datos=['proyecto'=>$proyecto,'participantes'=>$participantes,'tareas'=>$tareas];
       $this->view('proyecto', $datos);
    }
}
