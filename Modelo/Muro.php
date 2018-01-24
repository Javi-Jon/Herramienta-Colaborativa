<?php

require_once __DIR__ .'./ModeloBD.php';
class Muro extends BD {
    private $id;
    private $mensaje;
    private $hora;
    private $proyecto;
    private $autor;

    private $tabla = "muro";

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
    public function getMensaje()
    {
        return $this->mensaje;
    }

    /**
     * @param mixed $mensaje
     */
    public function setMensaje($mensaje)
    {
        $this->mensaje = $mensaje;
    }

    /**
     * @return mixed
     */
    public function getHora()
    {
        return $this->hora;
    }

    /**
     * @param mixed $hora
     */
    public function setHora()
    {
        $this->hora = date("Y-m-d h:i:sa");
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
    public function getAutor()
    {
        return $this->autor;
    }

    /**
     * @param mixed $autor
     */
    public function setAutor($autor)
    {
        $this->autor = $autor;
    }
    function getMuro() {
        $muro= $this->fSelectN("SELECT usuarios.fullname, mensaje, muro.hora FROM `muro`,usuarios WHERE muro.proyecto=:proyecto AND usuarios.id =muro.autor ORDER BY hora DESC", ['proyecto'=> $this->getProyecto()]);
        return $muro;
    }
    function publicarenMuro() {
       $id=$this->insert("INSERT INTO `muro`( `mensaje`, `hora`, `proyecto`, `autor`) VALUES (:mensaje,:hora,:proyecto,:autor)", ['mensaje'=>$this->getMensaje(),'hora'=> $this->getHora(),'proyecto'=> $this->getProyecto(),'autor'=> $this->getAutor()]);
        return $id;
    }


}