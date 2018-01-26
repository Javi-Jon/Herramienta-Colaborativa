<?php
require_once 'ControllerGenerico.php';
require_once __DIR__ . '/../Modelo/Mensaje.php';

class MensajesController extends Controller{
    function run($action) {
       switch ($action) {
            case'rm':
                $this->readConversacion();
           break;
           case'cm':
               $this->enviarMensaje();
               break;
           case 'notifMsjs':
               $this->notificacionesMensajes();
               break;

           default:
               break;
       }
      
           
   }
   function readConversacion() {
       $conversacion=new Mensaje();
       $conversacion->setRecibe($_SESSION['idusuario']);
      
       $conversacion->setEnvia($_GET['id']);
       $mensajes=$conversacion->getConversacion();
       $conversacion->conversacionLeida($_GET['id'],$_SESSION['idusuario']);
    echo json_encode(['idusuario'=>$_SESSION['idusuario'],'msjs'=>$mensajes]);
   }
   function enviarMensaje() {
       $mensaje=new Mensaje();
       $mensaje->setEnvia($_SESSION['idusuario']);
       $mensaje->setMensaje($_POST['mensaje']);
       $mensaje->setRecibe($_POST['recibe']);
       $mensaje->setEstado(0);
       $mensaje->setHora();
       $id=$mensaje->enviarMensaje();
    echo $id;
   }
   function notificacionesMensajes(){
       $msjs=new Mensaje();
       $msjs->setRecibe($_SESSION['idusuario']);
      $numero= $msjs->contarMensajesPendientes();
              echo $numero;
   }
}
