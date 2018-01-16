<?php

require_once 'ControllerGenerico.php';
require_once __DIR__ .'/../Modelo/Tarea.php';

class TareasController extends Tarea {
   function run($action){
        switch ($action) {
            case 'rself':
                $this->readMisTareas();
                break;
           
            default:
                break;
        }
    }
    function readMisTareas(){
        $tareas=new Tarea();
        $tareas=$tareas->getTareasByUser($_SESSION['idusuario']);
        echo json_encode($tareas);
    }
}
