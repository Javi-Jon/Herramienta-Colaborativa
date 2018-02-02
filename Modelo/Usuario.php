<?php

require_once __DIR__ . '/ModeloBD.php';

class Usuario extends BD {

    private $id;
    private $username;
    private $password;
    private $tipo;
    private $fullname;
    private $correo;
    private $tabla = "usuarios";

    function __construct() {
        
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

    function getCorreo() {
        return $this->correo;
    }

    function setCorreo($correo) {
        $this->correo = $correo;
    }

    function registrar() {

        $password = password_hash($this->getPassword(), 1);
        $id = $this->insert("INSERT INTO $this->tabla (username, password, tipo,fullname,correo) VALUES (:username,:password,:tipo,:fullname,:correo)", ['username' => $this->getUsername(), 'password' => $password, "tipo" => $this->getTipo(), "fullname" => $this->getFullname(), 'correo' => $this->getCorreo()]);
        //mail($usuario->getCorreo(), "registro", "te has registrado");  //METER MAIL AQUI?

        return $id;
    }

    function login() {

        $item = $this->fSelectO("SELECT id, fullname, password FROM $this->tabla WHERE username=:username AND tipo=1", ['username' => $this->getUsername()]);
        if (password_verify($this->password, $item->password)) {
// LOGIN CORRECTO
            $_SESSION['idusuario'] = $item->id;
            return true;
        } else {
            return false;
        }
    }

    function getUsuarioByUsername() {
        $item = $this->fSelectO("SELECT id, fullname FROM $this->tabla WHERE username=:username", ['username' => $this->getUsername()]);
        return $item;
    }

    function getUsuarioByID() {
        $item = $this->fSelectO("SELECT id, fullname FROM $this->tabla WHERE id=:id", ['id' => $this->getId()]);
        return $item;
    }

    function getCompaneros() {
        $conocidos = $this->fSelectN("
            SELECT DISTINCT usuarios.id,username,(SELECT COUNT(*)  FROM mensajes WHERE envia=usuarios.id and recibe=:idusuario AND estado=0) AS pendientes   
            FROM `participaciones`,usuarios,mensajes 
            WHERE idproyecto IN (SELECT idproyecto 
                           FROM `participaciones`
                           WHERE idusuario=:idusuario)
            AND participaciones.idusuario=usuarios.id AND usuarios.id <>:idusuario", ['idusuario' => $this->getId()]);
        return $conocidos;
    }

    function confirmAcc() {
        $filas = $this->update("UPDATE `usuarios` SET `tipo`=1 WHERE id=:idusuario", ['idusuario' => $this->getId()]);
        return $filas;
    }

}
