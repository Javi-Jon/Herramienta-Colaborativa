<?php

require_once __DIR__ .'./ModeloBD.php';
class Proyecto extends BD{
    private $id;
    private $nombre;
    private $descripcion;
    private $creacion;
    private $creador;
    
    private $tabla="proyectos";
            
    function __construct() {
       
    }
    function getId() {
        return $this->id;
    }

    function getNombre() {
        return $this->nombre;
    }

    function getDescripcion() {
        return $this->descripcion;
    }

    function getCreacion() {
        return $this->creacion;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setNombre($nombre) {
        $this->nombre = $nombre;
    }

    function setDescripcion($descripcion) {
        $this->descripcion = $descripcion;
    }

    function setCreacion($creacion) {
        $this->creacion = $creacion;
    }
    
    function getCreador() {
        return $this->creador;
    }

    function setCreador($creador) {
        $this->creador = $creador;
    }

        
    function nuevoProyecto(){
        $id=$this->insert("INSERT INTO $this->tabla (nombre,descripcion,creacion,creador) VALUES (:nombre,:descripcion,:creacion,:creador)", ['nombre'=> $this->getNombre(),'descripcion'=> $this->getDescripcion(),'creacion'=>date("Y-n-j"),'creador'=> $this->getCreador()]);
        return $id;
    }



   
}
