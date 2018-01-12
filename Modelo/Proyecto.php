<?php

require_once './ModeloBD.php';
class Proyecto extends BD{
    private $id;
    private $nombre;
    private $descripcion;
    private $creacion;
    
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



   
}
