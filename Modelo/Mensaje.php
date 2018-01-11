<?php

require_once './ModeloBD.php';
class Mensaje extends BD{
   private $id;
   private $envia;
   private $recibe;
   private $mensaje;
   private $hora;
   private $estado;
   
   function __construct() {
       $this->tabla="mensajes";
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

   function setHora($hora) {
       $this->hora = $hora;
   }

   function setEstado($estado) {
       $this->estado = $estado;
   }



}
