<?php
require_once 'ControllerGenerico.php';
require_once __DIR__ . '/../Modelo/Muro.php';

class MuroController extends Controller {
   function run($action) {
       switch ($action) {
            case'cm':
                $this->createMessage();
           break;

           default:
               break;
       }
      
           
   }
   function readMuro($idproyecto){
       $muro=new Muro();
       $muro->setProyecto($idproyecto);
       $mensajes=$muro->getMuro();
       return $mensajes;
   }
   function createMessage() {      
       $muro=new Muro();
       $muro->setMensaje($_POST['mensaje']);
       $muro->setHora();
       $muro->setProyecto($_POST['proyecto']);
       $muro->setAutor($_SESSION['idusuario']);
       print_r(get_defined_vars());
       $id=$muro->publicarenMuro();
       echo $id;
   }
}
