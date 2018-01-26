
comprobarMisTareas();

//console.log(tareas);
//construirElemTareas();
contarMensajes();
buscarComps();
$(document).ready(function () {
    
    //alertify.success("Success log message");
    $('#subm-newProy').click(function (e) {
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
               alertify.error("Error log message");
            }
        });
    });
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
                    formulario[0].reset();
                }

            },
            error: function () {
              alertify.error("Error log message");
            }
        });
    });

    $("#container").on('click', '.bborrar', function () {
        participacion = $(this).parent();
        $.ajax({
            url: './index.php?controller=proyecto&action=dp&idpart=' + $(this).attr('idpart'),
            method: 'GET',
            success: function (datos) {
                if (datos == 1) {
                    participacion.remove();
                }
            },
            error: function () {
               alertify.error("Error log message");
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
              alertify.error("Error log message");
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
                   $(selector).next().css('text-decoration', 'line-through').parent().delay(750).fadeOut();
                } else {
                   alertify.error("Error log message");
                }
            },
            error: function () {
               alertify.error("Error log message");
            }
        });

      
    });
    $('#blayout').click(function(){
       $('.proyectos-index-r').toggleClass('fd-c'); 
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
                   alertify.error("Error log message");
                }
            },
            error: function () {
                alertify.error("Error log message");
            }
        });
        
    });
    $('#nvb-msjs').click(function(){
        $('#mensajes-modal').modal('show');
    });
   $("#mensajes-modal").on('click', '.conver', function (){
        buscarConversavcion($(this).attr('dataVal'));
   });
    $("#mensajes-modal").on('submit', '#form-chat', function (e) {
        e.preventDefault();
        $.ajax({
            url:"./index.php?controller=mensaje&action=cm",
            data:$('#form-chat').serialize(),
            method:'POST',
            success:function(data){
                
                if(data!=0){
                    alertify.success('asdas');
                }
            },
            error: function () {
                alertify.error("Error log message");
            }
        });
        $('#form-chat').prepend("<div class='msj self-msj'>"+$('[name="mensaje"]').val()+"</div>");
        $('#form-chat')[0].reset();
        
    });
    
    
    
 
});
function comprobarMisTareas() {

    $.ajax({
        url: "./index.php?controller=tareas&action=rself",
        success: function (tareas) {
            tarea = jQuery.parseJSON(tareas);
            construirElemTareas(tarea);
        },
        error: function () {
           alertify.error("Error log message");
        }


    });

}
function construirElemTareas(tareas) {
    $('.tareas-wrap').empty();
   $('#mistareas-btn > .badge').html(tareas.length);
    tareas.forEach(function (tarea) {
        $('.tareas-wrap').append('<li class="tarea-li"><div><input type="checkbox" value="' + tarea.id + '" class="realizar-tarea"><span>' + tarea.titulo + tarea.plazo + tarea.estado + '</span><span class="tarea-span"><i class="material-icons beditarTarea" idtarea="' + tarea.id + '">mode_edit</i><i class="material-icons bborrarTarea" idtarea="' + tarea.id + '">delete</i></span></div></li>');
    });

}
function construirCompaneros(convers) {
 $('#ul-convers').empty();
//   $('#mistareas-btn > .badge').html(convers.length);
    convers.forEach(function (persona) {
        $('#div-convers').append('<div class="conver" dataVal="'+persona.id+'">'+persona.username+'('+persona.pendientes+')</div>');
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
           alertify.error("Error log message");
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
           alertify.error("Error log message");
        }
        
   //     crear alerta de mensajes que faltan por leer y borrarlo usando el data val y el id que me pasan
    });
    
}
function construirConversacion(conversacion,id){
    $('#wrap-conversacion').empty();
     conversacion.msjs.forEach(function (mensaje) {
      if(mensaje.envia==conversacion.idusuario){
           $('#wrap-conversacion').append('<div class="msj self-msj">'+mensaje.mensaje+'</div>');
      }else{
        $('#wrap-conversacion').append('<div class="msj" >'+mensaje.mensaje+'</div>');
    }
    });
    $('#wrap-conversacion').append('<form id="form-chat"><input type="text" name="mensaje"><input type="hidden" name="recibe" value="'+id+'"><input type="submit"></form>');
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
           alertify.error("Error log message");
        }
    });
}

