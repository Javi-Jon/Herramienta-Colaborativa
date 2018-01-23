<?php include_once 'header.php'; ?>
<style>
    *{
        box-sizing: border-box;
    }
    .jumbotron{
        color: #fff;
        padding-top: 120px;
        padding-bottom: 120px;
        display: flex;
        justify-content: center;
        align-items: center;
        border-radius: 0px;
    }
    #banner{
        background: url("../img/main_colab.png");
        background-size: 100%;
        max-width: 100%;
        height: 700px;
    }
    .texto{
        min-width: 200px;
    }
    .vacio{
        flex-basis:  20%;
    }
    blockquote{
        font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif; //CSS-Tricks
        font-weight: 300;
        font-size: 2em;
    }
    .card{
        color:#000;
        width: 25rem;
        padding: 20px;
        display: flex;
    }
    hr {
        border: 0.5px solid #000;
        width: 95%;
        display: flex;
        flex-direction: row;
        margin-top: 0.5em;
        margin-bottom: 0.5em;
        margin-left: auto;
        margin-right: auto;
    }
    nav{
        padding-top: 30px;
        padding-bottom: 30px;
    }
    .form-control::placeholder{
         color:lightgrey;
     }
</style>
    <nav class="navbar navbar-toggleable-md navbar-inverse bg-inverse">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="true" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>


        <a class="navbar-brand" href="#"><img src="../img/logo2.png" class="img-responsive" height="40"></a>

        <div class="navbar-collapse collapse show " id="navbarColor01" aria-expanded="true" style="">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item ">
                    <a class="nav-link" href="#">Tus proyectos </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="material-icons">face</i><span class="badge badge-danger">2</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="#"><i class="material-icons">email</i><span class="badge badge-danger">2</span></a>
                </li>
                <li class="nav-item ">
                    <button class="btn btn-success d-flex align-items-center m-top-nav" data-toggle="modal" data-target="#proyect-modal" ><i class="material-icons">add_box</i>Nuevo Proyecto</button>
                </li>
            </ul>
            <div class="navbar-nav">
                <a class="nav-link nav-item d-flex align-items-center" style="color:white;" href="">Registrarse</a>
                <span class="nav-link nav-item d-flex align-items-center"> o </span>
                <a class="nav-link nav-item d-flex align-items-center" style="color:white;" href="#">Iniciar sesión</a>
            </div>


        </div>
    </nav>
    <div class="jumbotron" id="banner">
        <div class="texto">
            <blockquote>
                "Reunirse es un comienzo, <br />
                permanecer juntos es un progreso<br />
                pero trabajar juntos es el éxito"
            </blockquote>
            <small>
                <i>
                    - Henry Ford -
                </i>
            </small>
        </div>
        <div class="vacio"></div>
        <div class="card">
            <div class="form-group">
                <form action="../index.php?controller=usuario&action=c" method="POST" class="form">
                    <input type="text" name="fullname" class="form-control" placeholder="Nombre y apellidos"><br>
                    <input type="text" name="username" class="form-control" placeholder="Elige un nombre de usuario"><br>
                    <input type="password" name="password" id="contrasena" class="form-control" placeholder="Contraseña">
                    <i id="i1" class="fa fa-eye fa-lg" style="color: lightgrey;" title="Mostrar contraseña" aria-hidden="true" onmousedown="mouseDown('contrasena', '#i1')" onmouseup="mouseUp('contrasena', '#i1')"></i><br>
                    <input type="email" name="correo" class="form-control" placeholder="nombre@ejemplo.com"><br>
                    <input type="submit" class="btn btn-success" value="Registrarse en ViWeb Colaborativa">
                </form>

                <form action="../index.php?controller=usuario&action=log" method="POST">
                    <input type="text" name="username" class="form-control" placeholder="Usuario"><br>
                    <input type="password" name="password" id="contrasenaLogin" class="form-control" placeholder="Contraseña">
                    <i id="i2" class="fa fa-eye fa-lg" style="color: lightgrey;" title="Mostrar contraseña" aria-hidden="true" onmousedown="mouseDown('contrasenaLogin', '#i2')" onmouseup="mouseUp('contrasenaLogin', '#i2')"></i><br>
                    <input type="submit" class="btn btn btn-success" value="Acceder">
                </form>
            </div>
        </div>
    </div>

<?php include_once 'footer.php'; ?>