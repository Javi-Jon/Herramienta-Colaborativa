<?php

require_once 'ControllerGenerico.php';
require_once __DIR__ . '/../Modelo/Tarea.php';

class TareasController extends Tarea {

    function run($action) {
        switch ($action) {
            case 'rself':
                $this->readMisTareas();
                break;
            case 'ubyID':
                $this->updateTarea();
                break;
            case 'marcarDone':
                $this->realizarTarea();
                break;
            case 'dbyID':
                $this->deleteTarea();
                break;
            default:
                break;
        }
    }

    function readMisTareas() {
        $tareas = new Tarea();
        $tarea = $tareas->getTareasByUser($_SESSION['idusuario']);
        echo json_encode($tarea);
    }

    function updateTarea() {
        $tarea = new Tarea();
        $tarea->setId($_POST['id']);
        $tarea->setTitulo($_POST['titulo']);
        $tarea->setDescripcion($_POST['descripcion']);
        $tarea->setDificultad($_POST['dificultad']);
        $tarea->setPlazo($_POST['plazo']);
        $filas = $tarea->editarTarea();
        echo $filas;
    }

    function realizarTarea() {
        $tarea = new Tarea();
        $tarea->setId($_GET['idtarea']);
        $filas = $tarea->marcarRealizada();
        if ($filas == 1) {
            echo '1';
        } else {
            echo '0';
        }
    }
     function deleteTarea() {
        $tarea = new Tarea();
        $tarea->setId($_GET['idtarea']);
        $filas = $tarea->borrarTarea();
        if ($filas == 1) {
            echo '1';
        } else {
            echo '0';
        }
    }

}
