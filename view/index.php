<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons"     rel="stylesheet">
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
        <link rel="stylesheet" href="css/validetta.min.css">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js" ></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" ></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" ></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
      <script src="js/validetta.min.js"></script>

        <div id="container">
            <nav class="navbar navbar-toggleable-md navbar-inverse bg-inverse">
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="true" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <a class="navbar-brand" href="index.php"><img src="img/logo2.png" class="img-responsive" height="40"></a>

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

                        </li>
                    </ul>
                    <div class="navbar-nav "><button class="btn btn-success d-flex align-items-center m-top-nav" data-toggle="modal" data-target="#proyect-modal" ><i class="material-icons">add_box</i>Nuevo Proyecto</button>
                        <button class="btn btn-warning d-flex align-items-center m-top-nav "  id="mistareas-btn"><i class="material-icons">assignment</i> <span class="badge badge-danger">4</span>Mis tareas </button>
                        <a class="nav-link nav-item  d-flex align-items-center" href="#"><i class="material-icons">account_circle</i>Bienvenido{{nombre}}</a>
                    </div>


                </div>
            </nav>     
            <div class="modal fade" id="proyect-modal" tabindex="-1" role="dialog"  aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">New message</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="../index.php?controller=proyecto&action=c" method="POST" id="newProy">
                                <div class="form-group">
                                    <label for="recipient-name" class="col-form-label">Nombre del Proyecto</label>
                                    <input type="text" class="form-control" id="recipient-name" name="nombre">
                                </div>
                                <div class="form-group">
                                    <label for="desc-proj" class="col-form-label">Descripcion del Proyecto</label>
                                    <textarea class="form-control" id="desc-proj" name="descripcion"></textarea>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <input type="submit" class="btn btn-primary" id="subm-newProy">
                                </div>
                            </form>
                        </div>                        
                    </div>
                </div>
            </div>

            <div class="modal fade" id="participantes-modal" tabindex="-1" role="dialog"  aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Añadir participantes</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div>
                                <ul id="participantes">
                                    <li  class="alert alert-success">
                                        <button>X</button></li>
                                </ul>
                                <div class="input-group ">
                                    <div class="input-group-addon"><i class="material-icons">account_circle</i></div>
                                    <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="Username">
                                </div>
                                <form id='formuser'>
                                    <input type="text" name="username">
                                    <input type="submit" id="subm-part">
                                </form>
                            </div>
                        </div>                        
                    </div>
                </div>
            </div>
            
            
            <div class="modal fade" id="mistareas-modal" tabindex="-1" role="dialog"  aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Mis tareas</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div>
                                <ul class="tareas-wrap">
                                    

                                </ul>
                                <hr>todo
                            </div>
                        </div>                        
                    </div>
                </div>
            </div>

        <!--ESTO ES EL CUERPO -->
        <div id="wrapper">
{% block content %}
{% endblock %}

           </div>


        </div>

            <script src="js/index.js"></script>
    </body>

</html>
