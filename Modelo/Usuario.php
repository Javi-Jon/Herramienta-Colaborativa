<?php

require_once './ModeloBD.php';

class Usuario extends BD {

    private $id;
    private $username;
    private $password;
    private $tipo;
    private $fullname;
    private $correo;

    function __construct() {
        $this->tabla = "usuarios";
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
        $password = password_hash($password, PASSWORD_BCRYPT);
        $this->password = $password;
    }

    function setTipo($tipo) {
        $this->tipo = $tipo;
    }

    function setFullname($fullname) {
        $this->fullname = $fullname;
    }

    function getCorreo() {
        return $this->correo;
    }

    function setCorreo($correo) {
        $this->correo = $correo;
    }

    function registrar() {
        $usuario = new Usuario();
        $usuario->insert('INSERT INTO :tabla(username, password, tipo,fullname,correo) VALUES (":username",":password",":tipo",":fullname",":correo");', ['tabla' => $this->tabla, 'username' => $this->username, 'password' => $this->password, "tipo" => 0, "fullname" => $this->fullname, 'correo' => $this->correo]);
        //METER MAIL AQUI?
    }

}
