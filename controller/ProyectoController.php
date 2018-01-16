<?php
require_once 'ControllerGenerico.php';
require_once __DIR__ .'/../Modelo/Proyecto.php';
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
}
