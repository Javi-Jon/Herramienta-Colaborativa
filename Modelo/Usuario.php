<?php
require_once './ModeloBD.php';
class Usuario extends BD{
 
    private $id;
    private $username;
    private $password;
    private $tipo;
    private $fullname;
    
    function __construct() {
        $this->tabla="usuarios";
    }
    function getId() {
        return $this->id;
    }

    function getUsername() {
        return $this->username;
    }

    function getPassword() {
        return $this->password;
    }

    function getTipo() {
        return $this->tipo;
    }

    function getFullname() {
        return $this->fullname;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setUsername($username) {
        $this->username = $username;
    }

    function setPassword($password) {
        $this->password = $password;
    }

    function setTipo($tipo) {
        $this->tipo = $tipo;
    }

    function setFullname($fullname) {
        $this->fullname = $fullname;
    }


}
