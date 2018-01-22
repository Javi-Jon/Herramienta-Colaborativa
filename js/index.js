
comprobarMisTareas();

//console.log(tareas);
//construirElemTareas();


$(document).ready(function () {
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
            },
            ajaxError: function () {
                alert('algo no ha ido como debia');
            }
        });
    });
    $('#mistareas-btn').click(function () {
        comprobarMisTareas();
        $('#mistareas-modal').modal('show');
    });

    $('#subm-part').click(function (evt) {
        evt.preventDefault();

        $.ajax({
            url: './index.php?controller=proyecto&action=ap&idproyecto=' + idproyecto,
            method: 'POST',
            data: $('#formuser').serialize(),
            success: function (dato) {
                if (dato === 'error') {
                    alert('error1');
                } else {
                    persona = jQuery.parseJSON(dato);
                    console.log(persona);
                    $('#participantes').append("<li  class='alert alert-success'>" + persona[0].fullname + " <button class='bborrar' idpart='" + persona.participacionID + "'>X</button></li>");
                }

            },
            ajaxError: function () {
                alert('algo no ha ido como debia');
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
            ajaxError: function () {
                alert('algo no ha ido como debia');
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
                alert('algo no ha ido como debia');
            }
        });

    });
    $(".tareas-wrap").on('click', '.realizar-tarea', function (e) {
       
        var idtarea = $(this).val();
        var selector='[value="'+idtarea+'"].realizar-tarea ';
        
        $.ajax({
            url: 'index.php?controller=tareas&action=marcarDone&idtarea=' + idtarea,
            success: function (datos) {
                if (datos == 1) {
                   $(selector).next().css('text-decoration', 'line-through').parent().delay(750).fadeOut();
                } else {
                    alert('ha habido un problema');
                }
            },
            error: function () {
                alert('algo no ha ido como debia');
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
                    alert('ha habido un problema');
                }
            },
            error: function () {
                alert('algo no ha ido como debia');
            }
        });
        
    });
 $('#banadirTarea').click(function(){
        
        
     var titulo=  $('#formNuevaTarea [name="titulo"]').val();
        var tarea=$('#formNuevaTarea').serialize();
        $.ajax({
            url:'index.php?controller=tareas&action=ct',
            data: tarea,
            method:'POST',
            success:function(data){
               if(data!==0){
                   console.log(data);
                   $('#asignaciones-modal .modal-title').html(titulo); 
                   $('#formNuevaTarea')[0].reset();
                   $('[name="idtarea"]').val(data);
                   $('#tareas-proyecto').append('<li>'+titulo+'</li>');
                   $('#asignaciones-modal').modal('show');                   
         
               }else{
                  alert('ha habido un error');
               }
                
            },
             error: function () {
                alert('algo no ha ido como debia');
            }
        });

    });
    
    $('#formAsign').submit(function(e){
       e.preventDefault();
      var data=$(this).serialize();
      $.ajax({
          url: "./index.php?controller=tareas&action=assign",
          method:'POST',
          data:data,
          success:function(dato){
              $('#asignaciones-modal').modal('hide');
          }
      });
    $(this)[0].reset(); 
});
$('#form-muro').submit(function(e){
    e.preventDefault();
    $.ajax({
        url:'index.php?controller=muro&action=cm',
        data: $(this).serialize,
        success:function(){
            $(this).append('<div class="comentario">hola</div>')
        }
    });
   
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
            alert('algo no ha ido como debia');
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

