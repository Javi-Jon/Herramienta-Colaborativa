<?php

require_once __DIR__ .'./ModeloBD.php';
class Tarea extends BD {
    private $id;
    private $titulo;
    private $descripcion;
    private $proyecto;
    private $estado;
    private $dificultad;
    private $plazo;

    private $tabla = "tareas";

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
    public function getTitulo()
    {
        return $this->titulo;
    }

    /**
     * @param mixed $titulo
     */
    public function setTitulo($titulo)
    {
        $this->titulo = $titulo;
    }

    /**
     * @return mixed
     */
    public function getDescripcion()
    {
        return $this->descripcion;
    }

    /**
     * @param mixed $descripcion
     */
    public function setDescripcion($descripcion)
    {
        $this->descripcion = $descripcion;
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

    /**
     * @return mixed
     */
    public function getEstado()
    {
        return $this->estado;
    }

    /**
     * @param mixed $estado
     */
    public function setEstado($estado)
    {
        $this->estado = $estado;
    }

    /**
     * @return mixed
     */
    public function getDificultad()
    {
        return $this->dificultad;
    }

    /**
     * @param mixed $dificultad
     */
    public function setDificultad($dificultad)
    {
        $this->dificultad = $dificultad;
    }

    /**
     * @return mixed
     */
    public function getPlazo()
    {
        return $this->plazo;
    }

    /**
     * @param mixed $plazo
     */
    public function setPlazo($plazo)
    {
        $this->plazo = $plazo;
    }

    function nuevaTarea() {
        $filas= $this->insert("INSERT INTO $this->tabla (titulo, descripcion, proyecto, estado, dificultad, plazo) VALUES (:titulo, :descripcion, :proyecto, :estado, :dificultad, :plazo)", ["titulo"=>$this->getTitulo(), "descripcion"=>$this->getDescripcion(), "proyecto"=>$this->getProyecto(), "estado"=>$this->getEstado(), "dificultad"=>$this->getDificultad(), "plazo"=>$this->getPlazo()]);
        return $filas;
    }

    function borrarTarea() {
      $filas=  $this->delete("DELETE FROM `tareas` WHERE id=:id",['id'=> $this->getId()]);
     
        return $filas;
    }
    function editarTarea(){
        $filas=$this->update("UPDATE $this->tabla SET `titulo`=:titulo,`descripcion`=:descripcion,`dificultad`=:dificultad,`plazo`=:plazo WHERE id=:id", ['titulo'=> $this->getTitulo(),'descripcion'=> $this->getDescripcion(),'dificultad'=> $this->getDificultad(),'plazo'=> $this->getPlazo(),'id'=> $this->getId()]); 
       return $filas;
    }
    function getTareasByUser($iduser){
        $tareas=$this->fSelectN("SELECT tareas.`id`, `titulo`, `descripcion`, `proyecto`, `estado`, `dificultad`, `plazo` FROM $this->tabla, asignacion WHERE  tareas.id=asignacion.idtarea AND asignacion.iduser=:user AND estado=0", ['user'=>$iduser]);
      return $tareas; 
        
    }
    function marcarRealizada() {
        $estado= $this->update("UPDATE $this->tabla SET `estado`=1 WHERE id=:id",['id'=> $this->getId()]);
        return $estado;
    }
}