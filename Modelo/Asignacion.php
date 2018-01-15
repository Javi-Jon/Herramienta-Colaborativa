<?php

require_once './ModeloBD.php';
class Asignacion extends BD {

    private $id;
    private $idTarea;
    private $iduser;

    private $tabla = "asignacion";

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
    public function getIdTarea()
    {
        return $this->idTarea;
    }

    /**
     * @param mixed $idTarea
     */
    public function setIdTarea($idTarea)
    {
        $this->idTarea = $idTarea;
    }

    /**
     * @return mixed
     */
    public function getIduser()
    {
        return $this->iduser;
    }

    /**
     * @param mixed $iduser
     */
    public function setIduser($iduser)
    {
        $this->iduser = $iduser;
    }


}