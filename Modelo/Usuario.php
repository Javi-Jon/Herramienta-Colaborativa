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
        echo $usuario->insert("INSERT INTO $this->tabla (username, password, tipo,fullname,correo) VALUES (:username,:password,:tipo,:fullname,:correo)", ['username' => $this->getUsername(), 'password' => $this->getPassword(), "tipo" => $this->getTipo(), "fullname" => $this->getFullname(), 'correo' => $this->getCorreo()]);
        //mail($usuario->getCorreo(), "registro", "te has registrado");  //METER MAIL AQUI?

        $mensaje = '<div>te has registrado con exito</div> ';

        //para el envío en formato HTML 
        $headers = "MIME-Version: 1.0\r\n";
        $headers .= "Content-type: text/html; charset=iso-8859-1\r\n";

        //dirección del remitente 
        $headers .= "From: javier marin <pruebasjavier3@gmail.com>\r\n";

        //dirección de respuesta, si queremos que sea distinta que la del remitente 
        $headers .= "Reply-To: pruebasjavier3@gmail.com\r\n";

        if (mail($usuario->getCorreo(), 'pruebaclase', $mensaje, $headers)) {
            echo 'exito';
        } else {
            echo 'error';
        }
    }

}
