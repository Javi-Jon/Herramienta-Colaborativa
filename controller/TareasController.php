<?php

require_once 'ControllerGenerico.php';
require_once __DIR__ .'/../Modelo/Tarea.php';

class TareasController extends Tarea {
   function run($action){
        switch ($action) {
            case 'rself':
                $this->readMisTareas();
                break;
            case 'ubyID':
                $this->updateTarea();
                break;
            default:
                break;
        }
    }
    function readMisTareas(){
        $tareas=new Tarea();
        $tarea=$tareas->getTareasByUser($_SESSION['idusuario']);
        echo json_encode($tarea);
    }
    function updateTarea(){       
        $tarea=new Tarea();
        $tarea->setId($_POST['id']);
        $tarea->setTitulo($_POST['titulo']);
        $tarea->setDescripcion($_POST['descripcion']);
        $tarea->setDificultad($_POST['dificultad']);
        $tarea->setPlazo($_POST['plazo']);
        $filas=$tarea->editarTarea();        
        echo $filas;
        }
        function realizarTarea(){
   
            
        }
}
