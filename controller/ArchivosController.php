<?php

require_once 'ControllerGenerico.php';
require_once __DIR__ . '/../Modelo/Archivo.php';
require_once 'ProyectoController.php';

class ArchivosController extends Controller {

    function run($action) {
        switch ($action) {
            case 'nArch':
                $this->nuevoArchivo();
                break;
            case 'bArch':
                $this->borrarArchivo();
                break;
            case 'getArch':
                $this->getArchivosProyecto();
                break;
            default:
                break;
        }
    }

    function borrarArchivo() {
        $archivo = new Archivo();
        $archivo->setId($_GET['idtarea']);
        $filas = $archivo->borrarTarea();
        if ($filas == 1) {
            echo '1';
        } else {
            echo '0';
        }
    }

    function getArchivosProyecto(){
        $archivo = new Archivo();
        $archivo->setProyecto($_GET['idProyecto']);
        $archivo=$archivo->getArchivosByProyecto();
        return $archivo;
    }

    function nuevoArchivo() {
        $dir_subida = './Archivos/';
        if ($_FILES['userfile']){
            if ($_FILES['userfile']['error'] == UPLOAD_ERR_OK) {
                $temp = explode(".", $_FILES['userfile']['name']);
                $newfilename = round(microtime(true)) . '.' . end($temp);

                $fichero_subido = $dir_subida . basename($newfilename);

                if (move_uploaded_file($_FILES['userfile']['tmp_name'], $fichero_subido)) {
                    $archivo = new Archivo();
                    $archivo->setNombre($_FILES['userfile']['name']);
                    $archivo->setRuta($fichero_subido);
                    $archivo->setProyecto($_GET['idProyecto']);
                    $filas = $archivo->nuevoArchivo();

                    if ($filas >= 1) {
                        echo '1';
                    } else {
                        echo '0';
                    }
                }
            }
        }
    }
}