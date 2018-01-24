<?php

require_once __DIR__.'/ModeloBD.php';
class Mensaje extends BD{
   private $id;
   private $envia;
   private $recibe;
   private $mensaje;
   private $hora;
   private $estado;
   
   private $tabla="mensajes";
   function __construct() {
       
   }
   function getId() {
       return $this->id;
   }

   function getEnvia() {
       return $this->envia;
   }

   function getRecibe() {
       return $this->recibe;
   }

   function getMensaje() {
       return $this->mensaje;
   }

   function getHora() {
       return $this->hora;
   }

   function getEstado() {
       return $this->estado;
   }

   function setId($id) {
       $this->id = $id;
   }

   function setEnvia($envia) {
       $this->envia = $envia;
   }

   function setRecibe($recibe) {
       $this->recibe = $recibe;
   }

   function setMensaje($mensaje) {
       $this->mensaje = $mensaje;
   }

   function setHora() {
      $this->hora = date("Y-m-d h:i:sa");
   }

   function setEstado($estado) {
       $this->estado = $estado;
   }
   function getConversacion(){
       $conversacion= $this->fSelectN("SELECT * FROM `mensajes` WHERE (envia=:envia AND recibe=:recibe)OR (envia=:recibe AND recibe=:envia) order by hora asc", ['envia'=> $this->getEnvia(),'recibe'=> $this->getRecibe()]);
       return $conversacion;
   }
   function enviarMensaje(){
       $id= $this->insert("INSERT INTO `mensajes`( `envia`, `mensaje`, `recibe`, `hora`, `estado`) VALUES (:envia,:mensaje,:recibe,:hora,:estado)", ['envia'=> $this->getEnvia(),'mensaje'=> $this->getMensaje(),'recibe'=> $this->getRecibe(),'hora'=> $this->getHora(),'estado'=> $this->getEstado()]);
       return $id;
       
   }



}
