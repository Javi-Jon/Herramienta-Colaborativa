<?php

require_once __DIR__ .'./ModeloBD.php';
class Proyecto extends BD{
    private $id;
    private $nombre;
    private $descripcion;
    private $creacion;
    private $creador;
    private $tipo;
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

                function getTipo() {
                    return $this->tipo;
                }

                function setTipo($tipo) {
                    $this->tipo = $tipo;
                }

                        
    function nuevoProyecto(){
        $id=$this->insert("INSERT INTO $this->tabla (nombre,descripcion,creacion,creador,tipo) VALUES (:nombre,:descripcion,:creacion,:creador,:tipo)", ['nombre'=> $this->getNombre(),'descripcion'=> $this->getDescripcion(),'creacion'=>date("Y-n-j"),'creador'=> $this->getCreador(),'tipo'=> $this->getTipo()]);
        return $id;
    }
    function anadirParticipante($idusuario){
       
        $idParticipacion=$this->insert("INSERT INTO participaciones (idusuario,idproyecto) VALUES (:idusuario,:idproyecto)", ['idusuario'=>$idusuario,'idproyecto'=> $this->getId()]);
        return $idParticipacion;
    }
    function getParticipaciones() {
       $participantes= $this->fSelectN("SELECT participaciones.id as 'participacion', usuarios.username, usuarios.id, usuarios.fullname FROM participaciones,usuarios WHERE usuarios.id=participaciones.idusuario AND participaciones.idproyecto=:idproyecto", ['idproyecto'=> $this->getId()]);
       return $participantes;
    }
    function deleteParti($id) {
        $filas=$this->delete("DELETE FROM participaciones WHERE id=:id", ['id'=>$id]);
        return $filas;
    }
    function getProyectosByUsuario($idusuario){
        $proyectos= $this->fSelectN("SELECT proyectos.`id`,`nombre`,`descripcion`,`creacion`,`creador`,tipo FROM `proyectos`,participaciones WHERE  proyectos.id=participaciones.idproyecto AND participaciones.idusuario=:idusuario ORDER BY proyectos.id DESC ", ['idusuario'=>$idusuario]);
    
       return $proyectos;
    }
    function getProyectoById(){
        $proyecto= $this->fSelectO("SELECT * FROM $this->tabla WHERE id=:id", ['id'=> $this->getId()]);
        return $proyecto;
    }
    function getStatsProyecto(){
        $stats= $this->fSelectN("SELECT COUNT(asignacion.id) as stat,usuarios.username FROM `asignacion`,usuarios,proyectos,tareas WHERE iduser=usuarios.id and tareas.proyecto=proyectos.id and asignacion.idtarea=tareas.id AND proyectos.id=:idproyecto GROUP BY usuarios.id",
                ['idproyecto'=> $this->getId()]);
        return $stats;
    }
    function deleteProyecto(){
        $filas= $this->delete("DELETE FROM $this->tabla WHERE id=:id",['id'=>$this->getId()]);
        return $filas;
    }
    function getPublicos($idusuario){
        $proyectos=$this->fSelectN("SELECT * FROM $this->tabla WHERE tipo=0 AND id NOT IN (select idproyecto from participaciones WHERE idusuario=:idusuario)", ['idusuario'=>$idusuario]);
        return $proyectos;
    }
    function getSolicitudes(){
        $solicitudes= $this->fSelectN("SELECT solicitudes.id, usuarios.fullname,usuarios.username,solicitudes.idusuario,usuarios.correo FROM `solicitudes`,usuarios WHERE idproyecto=:proyecto AND solicitudes.idusuario=usuarios.id",['proyecto'=> $this->getId()] );
        return $solicitudes;
    }
    function solicitarParticipacion($idusuario) {
      $id=$this->insert("INSERT INTO `solicitudes`( `idproyecto`, `idusuario`) VALUES (:idproyecto,:idusuario)", ['idproyecto'=> $this->getId(),'idusuario'=>$idusuario]);
      return $id;
    }
    function borrarSolicitud($id){
        $filas=$this->delete("DELETE FROM solicitudes WHERE id=:id", ['id'=>$id]);
        return $filas;
    }


   
}
