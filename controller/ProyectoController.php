<?php
require_once 'ControllerGenerico.php';
require_once __DIR__ .'/../Modelo/Proyecto.php';
class ProyectoController extends Controller{
     
    function run($action){
        switch ($action) {
            case 'c':
                $this->crearProyecto();
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
}
