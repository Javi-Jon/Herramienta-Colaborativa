<?php

require_once __DIR__ .'./ModeloBD.php';
class Archivo extends BD {
    private $id;
    private $nombre;
    private $ruta;
    private $proyecto;

    private $tabla = "archivos";

    function __construct(){

    }

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param mixed $id
     */
    public function setId($id)
    {
        $this->id = $id;
    }

    /**
     * @return mixed
     */
    public function getNombre()
    {
        return $this->nombre;
    }

    /**
     * @param mixed $nombre
     */
    public function setNombre($nombre)
    {
        $this->nombre = $nombre;
    }

    /**
     * @return mixed
     */
    public function getRuta()
    {
        return $this->ruta;
    }

    /**
     * @param mixed $ruta
     */
    public function setRuta($ruta)
    {
        $this->ruta = $ruta;
    }

    /**
     * @return mixed
     */
    public function getProyecto()
    {
        return $this->proyecto;
    }

    /**
     * @param mixed $proyecto
     */
    public function setProyecto($proyecto)
    {
        $this->proyecto = $proyecto;
    }

    function nuevoArchivo() {
        $id= $this->insert("INSERT INTO $this->tabla (nombre, ruta, proyecto) VALUES (:nombre, :ruta, :proyecto)", ["nombre"=>$this->getNombre(), "ruta"=>$this->getRuta(), "proyecto"=>$this->getProyecto()]);
        return $id;
    }

    function borrarArchivo() {
        $filas=  $this->delete("DELETE FROM `tareas` WHERE id=:id",['id'=> $this->getId()]);
        return $filas;
    }

    function getArchivosByProyecto(){
        $tareas=$this->fSelectN("SELECT nombre, ruta, proyecto FROM $this->tabla WHERE  proyecto = :idProyecto", ['idProyecto'=>$this->getProyecto()]);
        return $tareas;

    }


}