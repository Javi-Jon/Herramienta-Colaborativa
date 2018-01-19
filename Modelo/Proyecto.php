<?php

require_once __DIR__ .'./ModeloBD.php';
class Proyecto extends BD{
    private $id;
    private $nombre;
    private $descripcion;
    private $creacion;
    private $creador;
    
    private $participantes;


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
    
                function getParticipantes() {
                    return $this->participantes;
                }

                function setParticipantes($participantes) {
                    $this->participantes = $participantes;
                }

    
        
    function nuevoProyecto(){
        $id=$this->insert("INSERT INTO $this->tabla (nombre,descripcion,creacion,creador) VALUES (:nombre,:descripcion,:creacion,:creador)", ['nombre'=> $this->getNombre(),'descripcion'=> $this->getDescripcion(),'creacion'=>date("Y-n-j"),'creador'=> $this->getCreador()]);
        return $id;
    }
    function anadirParticipante($idusuario){
       
        $idParticipacion=$this->insert("INSERT INTO participaciones (idusuario,idproyecto) VALUES (:idusuario,:idproyecto)", ['idusuario'=>$idusuario,'idproyecto'=> $this->getId()]);
        return $idParticipacion;
    }
    function getParticipaciones() {
       $participantes= $this->fSelectN("SELECT usuarios.username, usuarios.id, usuarios.fullname FROM participaciones,usuarios WHERE usuarios.id=participaciones.idusuario AND participaciones.idproyecto=:idproyecto", ['idproyecto'=> $this->getId()]);
       return $participantes;
    }
    function deleteParti($id) {
        $filas=$this->delete("DELETE FROM participaciones WHERE id=:id", ['id'=>$id]);
        return $filas;
    }
    function getProyectosByUsuario($idusuario){
        $proyectos= $this->fSelectN("SELECT proyectos.`id`,`nombre`,`descripcion`,`creacion`,`creador` FROM `proyectos`,participaciones WHERE  proyectos.id=participaciones.idproyecto AND participaciones.idusuario=:idusuario", ['idusuario'=>$idusuario]);
    
       return $proyectos;
    }



   
}
