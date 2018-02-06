
comprobarMisTareas();

//console.log(tareas);
//construirElemTareas();
contarMensajes();
buscarComps();
$(document).ready(function () {
    //alertify.success("Success log message");
     $('#bperfil').click(function(){
         $('#perfil-modal').modal('show');
     });
     $('#form-perfil').validetta({
            realTime : true,
        onValid: function(e){
            e.preventDefault();
            $.ajax({
                url:'index.php?controller=usuario&action=uuser',
                method:'POST',
                data:$('#form-perfil').serialize(),
                success:function(filas){
                    if(filas==1){
                        alertify.success('actualizado con exito');
                    }else{
                        alertify.error('ha habido un problema puede que el nombre de usuario o el correo esten en uso');
                    }
                },
                error: function () {
                    alertify.error("Error en el servidor comprueba tu conexion y vuelve a intentarlo");
                }
                
            });
            
        }
            
        });
    $('#newProy').validetta({
         realTime : true,
        display:'bubble',
         bubblePosition: 'right', // Bubble position // right / bottom
  bubbleGapLeft: 50,
  onValid : function(e) {
      e.preventDefault();
        $.ajax({
            url: "index.php?controller=proyecto&action=c",
            method: 'POST',
            data: $('#newProy').serialize(),
            success: function (data) {
                console.log('idproyecto' + data);
                idproyecto = data;
                $('#proyect-modal').modal("hide");
                $('#participantes-modal').modal("show");
                $('#finalizar').attr("href",'index.php?controller=proyecto&action=vp&id='+data);

            },
            error: function () {
               alertify.error("Error en el servidor comprueba tu conexion y vuelve a intentarlo");
            }
        });
  }
    });
//    $('#subm-newProy').click(function (e) {
//        e.preventDefault();
//        $.ajax({
//            url: "index.php?controller=proyecto&action=c",
//            method: 'POST',
//            data: $('#newProy').serialize(),
//            success: function (data) {
//                console.log('idproyecto' + data);
//                idproyecto = data;
//                $('#proyect-modal').modal("hide");
//                $('#participantes-modal').modal("show");
//                $('#finalizar').attr("href",'index.php?controller=proyecto&action=vp&id='+data);
//
//            },
//            error: function () {
//               alertify.error("Error en el servidor comprueba tu conexion y vuelve a intentarlo");
//            }
//        });
   
    $('#participantes-modal').on('hide.bs.modal',function(e){
        e.preventDefault();
    });
    $('#mistareas-btn').click(function () {
        comprobarMisTareas();
        $('#mistareas-modal').modal('show');
    });


    $('.formuser').submit(function (evt) {
        evt.preventDefault();
        var formulario=$(this);

        $.ajax({
            url: './index.php?controller=proyecto&action=ap&idproyecto=' + idproyecto,
            method: 'POST',
            data: formulario.serialize(),
            success: function (dato) {
                if (dato === 'error') {
                  formulario.effect( "shake" );
                } else {
                    persona = jQuery.parseJSON(dato);
                    console.log(persona);
                    $('.participantes').append("<li  class=' d-flex justify-content-between'><div class='d-flex'><i class='material-icons'>perm_identity</i>"+persona[0].fullname+"</div><button class='bborrar' idpart='" + persona.participacionID + "'>X</button> </li>");
                    $('#participantes').append('<li class="d-flex align-items-center "> <i class="material-icons">perm_identity</i>'+persona[0].fullname+'<button class=" bborrar" idpart="'+ persona.participacionID +'">X</button></li>');
                    formulario[0].reset();
                }

            },
            error: function () {
              alertify.error("Error en el servidor comprueba tu conexion y vuelve a intentarlo");
            }
        });
    });

    $("#container").on('click', '.bborrar', function () {
        participacion = $(this).parent();
        var idpart=$(this).attr('idpart');
        $.ajax({
            url: './index.php?controller=proyecto&action=dp&idpart=' + $(this).attr('idpart'),
            method: 'GET',
            success: function (datos) {
                if (datos == 1) {
                    $('[idpart="'+idpart+'"]').parent().remove();
                }
            },
            error: function () {
               alertify.error("Error en el servidor comprueba tu conexion y vuelve a intentarlo");
            }
        });

    });
    $(".tareas-wrap").on('click', '.beditarTarea', function () {
        if ($(this).hasClass('editando')) {
            var selector = '#formTarea' + $(this).attr('idtarea');
            $(this).removeClass('editando');
            $(selector).remove();
        } else {
            $(this).addClass('editando');
            $(this).parent().parent().append('<form class="form-editar-tarea" id="formTarea' + $(this).attr('idtarea') + '"><input type="hidden" name="id" value="' + $(this).attr('idtarea') + '"><input type="text" name="titulo" placeholder="titulo"><input type="text" name="descripcion" placeholder="descripcion"><select name="dificultad"><option value="1">facil</option><option value="2">media</option><option value="3">dificil</option></select><input type="date" name="plazo"><input type="submit"></form>');
        }

    });
    $(".tareas-wrap").on('submit', '.form-editar-tarea', function (e) {
        e.preventDefault();
        $.ajax({
            url: 'index.php?controller=tareas&action=ubyID',
            data: $(this).serialize(),
            method: 'POST',
            success: function (datos) {
                if (datos == 1) {
                    comprobarMisTareas();
                }
            },
            error: function () {
              alertify.error("Error en el servidor comprueba tu conexion y vuelve a intentarlo");
            }
        });

    });
    $(".tareas-wrap").on('click', '.realizar-tarea', function (e) {
       
        var idtarea = $(this).val();
        var selector='[value="'+idtarea+'"].realizar-tarea ';
        
        $.ajax({
            url: 'index.php?controller=tareas&action=marcarDone&idtarea=' + idtarea+'&estado=1',
            success: function (datos) {
                if (datos == 1) {
                    $('[id="'+idtarea+'"').appendTo('#acabadas-append');
                   $(selector).next().css('text-decoration', 'line-through').parent().delay(750).fadeOut();
                } else {
                   alertify.error("Error desconocido vuelva a intentarlo mas adelante");
                }
            },
            error: function () {
               alertify.error("Error en el servidor comprueba tu conexion y vuelve a intentarlo");
            }
        });

      
    });
    $('#blayout').click(function(){
        $('.proyectos-index-r').toggleClass('d-flex');
        $(this).children().text(function(i, text){
            return text === "dashboard" ? "list" : "dashboard";
        })
    });
    
    $(".tareas-wrap").on('click', '.bborrarTarea', function (e) {
       var idtarea= $(this).attr('idtarea');
       var selector='[value="'+idtarea+'"].realizar-tarea ';
       $.ajax({
            url: 'index.php?controller=tareas&action=dbyID&idtarea=' + idtarea,
            success: function (datos) {
                if (datos == 1) {
                   $(selector).next().css('text-decoration', 'line-through').parent().delay(750).fadeOut();
                } else {
                   alertify.error("Error desconocido vuelva a intentarlo mas adelante");
                }
            },
            error: function () {
                alertify.error("Error en el servidor comprueba tu conexion y vuelve a intentarlo");
            }
        });
        
    });
    $('#nvb-msjs').click(function(){
        $('#mensajes-modal').modal('show');
    });
   $("#mensajes-modal").on('click', '.conver', function (){
        buscarConversavcion($(this).attr('dataVal'));
        $(this).children().remove();
        $('#titulo-mensajes').html($(this).html());
   });
    $("#mensajes-modal").on('submit', '#form-chat', function (e) {
        e.preventDefault();
        $.ajax({
            url:"./index.php?controller=mensaje&action=cm",
            data:$('#form-chat').serialize(),
            method:'POST',
            success:function(data){
                
                if(data!=0){
                    alertify.success('mensaje enviado');
             
                }
            },
            error: function () {
                alertify.error("Error en el servidor comprueba tu conexion y vuelve a intentarlo");
            }
        });

        $('#form-chat').parent().prev().after("<div class='msj self-msj'>"+$('[name="mensaje"]').val()+"<i class='material-icons'>timer</i></div>");
        $('#form-chat')[0].reset();
        
    });

/* *********************************************
     Mover tareas
 ********************************************* */

    $(function() {
        //var donde;
        //var elemento;

        $(".column").sortable({
            receive: function (event, ui) {
                elemento = ui.item.attr("id");
                actualizarEstadoTarea(elemento, donde);
            },
            connectWith: ".column",
            handle: ".portlet-header",
            cancel: ".portlet-toggle",
            placeholder: "portlet-placeholder ui-corner-all"
        });

        $(".portlet")
            .addClass("ui-widget ui-widget-content ui-helper-clearfix ui-corner-all")
            .find(".portlet-header")
            .addClass("ui-widget-header ui-corner-all")
            .prepend("<span class='ui-icon ui-icon-minusthick portlet-toggle'></span>");

        $(".estiloTarjeta").droppable({
            drop: function(event, ui) {
                // $(this).addClass("ui-state-highlight");
                donde = this.id;
            }/* ,
        over: function(event, ui) {
            $('.display').html( this.id );
        } */

        });

        $(".portlet-toggle").on("click", function() {
            var icon = $(this);
            icon.toggleClass("ui-icon-minusthick ui-icon-plusthick");
            icon
                .closest(".portlet")
                .find(".portlet-content")
                .toggle();
        });
    });
    /* *********************************************
         Fin mover tareas
    ********************************************* */
    
 
});



function comprobarMisTareas() {

    $.ajax({
        url: "./index.php?controller=tareas&action=rself",
        success: function (tareas) {
            tarea = jQuery.parseJSON(tareas);
            construirElemTareas(tarea);
        },
        error: function () {
           alertify.error("Error en el servidor comprueba tu conexion y vuelve a intentarlo");
        }


    });

}
function construirElemTareas(tareas) {
    $('.tareas-wrap').empty();
   $('#mistareas-btn > .badge').html(tareas.length);
    tareas.forEach(function (tarea) {
        $('.tareas-wrap').append('<li class="tarea-li"><div><input type="checkbox" value="' + tarea.id + '" class="realizar-tarea"><span class="">' + tarea.titulo+'<i class="material-icons">date_range</i> '+ tarea.plazo + '</span><span class="tarea-span"><i class="material-icons beditarTarea" idtarea="' + tarea.id + '">mode_edit</i><i class="material-icons bborrarTarea" idtarea="' + tarea.id + '">delete</i></span></div></li>');
    });

}
function construirCompaneros(convers) {
 $('#ul-convers').empty();
//   $('#mistareas-btn > .badge').html(convers.length);
    convers.forEach(function (persona) {
        if(persona.pendientes>0){
            $('#div-convers').append('<div class="conver" dataVal="'+persona.id+'">'+persona.username+'<span class="badge badge-success">'+persona.pendientes+'</span></div>'); 
        }
       else{
            $('#div-convers').append('<div class="conver" dataVal="'+persona.id+'">'+persona.username+'</div>'); 
       }
    
    });

}
function buscarComps() {

    $.ajax({
        url: "./index.php?controller=usuario&action=rcomp",
        success: function (convers) {
           console.log(convers);
            conversaciones = jQuery.parseJSON(convers);
            construirCompaneros(conversaciones);
        },
        error: function () {
           alertify.error("Error en el servidor comprueba tu conexion y vuelve a intentarlo");
        }


    });

}
function buscarConversavcion(id){
  console.log(id);
    $.ajax({
       url:"./index.php?controller=mensaje&action=rm&id="+id,
        success: function (convers) {
   console.log(convers);
            conversaciones = jQuery.parseJSON(convers);
            construirConversacion(conversaciones,id);
        },
        error: function () {
           alertify.error("Error en el servidor comprueba tu conexion y vuelve a intentarlo");
        }

   //     crear alerta de mensajes que faltan por leer y borrarlo usando el data val y el id que me pasan
    });
    
}
function construirConversacion(conversacion,id){
    $('#wrap-conversacion').empty();
     conversacion.msjs.forEach(function (mensaje) {
      if(mensaje.envia==conversacion.idusuario){
         (mensaje.estado==0)?$('#wrap-conversacion').append('<div class="msj self-msj">'+mensaje.mensaje+'<i class="material-icons">timer</i></div>'):$('#wrap-conversacion').append('<div class="msj self-msj">'+mensaje.mensaje+'<i class="material-icons">check</i></div>');
           
      }else{
        $('#wrap-conversacion').append('<div class="msj" >'+mensaje.mensaje+'</div>');
    }
    });
    $('#wrap-conversacion').append('<div><form id="form-chat" class="d-flex"><input type="text" name="mensaje" class="form-control"><input type="hidden" name="recibe" value="'+id+'"><button class="btn btn-success"><i class="material-icons">send</i></button></form></div>');
}
function contarMensajes(){
    $.ajax({
        url:'./index.php?controller=mensaje&action=notifMsjs',
        success:function(data){
            if(data>0){
                  $('#msjs').html(data);
            }
        },
        error: function () {
           alertify.error("Error en el servidor comprueba tu conexion y vuelve a intentarlo");
        }
    });
}


function actualizarEstadoTarea(idTarea, estado) {
    switch (estado){
        case "pendiente":
            $.ajax({
                url: 'index.php?controller=tareas&action=marcarPendiente&idtarea=' + idTarea,
                success: function (datos) {
                    if (datos == 1) {
                        alertify.success('Actualizado');
                    }else {
                        alertify.error("Error al actualizar el estado en la base de datos.");
                    }
                },
                error: function () {
                    alert("Error al actualizar el estado en la base de datos");
                }
            });
            break;
        case "terminado":
            $.ajax({
                url: 'index.php?controller=tareas&action=marcarDone&idtarea=' + idTarea,
                success: function (datos) {
                    if (datos == 1) {
                        alertify.success('Actualizado');
                    }else {
                        alertify.error("Error al actualizar el estado en la base de datos.1");
                    }
                },
                error: function () {
                    alert("Error al actualizar el estado en la base de datos.");
                }
            });
            break;
        default:
            alert("Ocurrió un error al actualizar la tarea, contacte con el administrador.");
            break;
    }
}
