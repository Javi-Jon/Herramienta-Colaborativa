
comprobarMisTareas();

//console.log(tareas);
//construirElemTareas();


$(document).ready(function(){
    $('#subm-newProy').click(function(e){
        e.preventDefault();        
        $.ajax({
            url:"index.php?controller=proyecto&action=c",
            method:'POST',
            data:$('#newProy').serialize(),
            success:function(data){
                console.log('idproyecto'+data);
                idproyecto=data;
                $('#proyect-modal').modal("hide");
                $('#participantes-modal').modal("show");
            },
            ajaxError:function(){
                alert('algo no ha ido como debia');
            }
        });
    });
    $('#mistareas-btn').click(function(){     
        comprobarMisTareas();
       $('#mistareas-modal').modal('show');
    });
    
    $('#subm-part').click(function(evt){
        evt.preventDefault();

        $.ajax({
                    url:'./index.php?controller=proyecto&action=ap&idproyecto='+idproyecto,
                    method:'POST',
                    data:$('#formuser').serialize(),                    
                     success:function(dato){                       
                         if(dato==='error'){
                             alert('error1');                             
                         }else{              
                        persona = jQuery.parseJSON(dato);
                        console.log(persona);
                        $('#participantes').append("<li  class='alert alert-success'>"+persona[0].fullname+" <button class='bborrar' idpart='"+persona.participacionID+"'>X</button></li>");
                         }                     
                                            
                    },
                    ajaxError:function(){
                alert('algo no ha ido como debia');
            }
                });
    });
    
     $("#container").on('click', '.bborrar', function () {
        participacion=$(this).parent();

        $.ajax({
            url:'./index.php?controller=proyecto&action=dp&idpart='+$(this).attr('idpart'),
            method:'GET',
           success:function(datos){            
               if(datos==1){                
                  participacion.remove();
               }
           },
           ajaxError:function(){
                alert('algo no ha ido como debia');
            }
        });
     
    });
      $(".tareas-wrap").on('click', '.beditarTarea', function () {
          if($(this).hasClass('editando')){
            var  selector='#formTarea'+$(this).attr('idtarea');
              $(this).removeClass('editando');              
              $(selector).remove();              
          }else{             
             $(this).addClass('editando');
             $(this).parent().parent().append('<form class="form-editar-tarea" id="formTarea'+$(this).attr('idtarea')+'"><input type="hidden" name="id" value="'+$(this).attr('idtarea')+'"><input type="text" name="titulo" placeholder="titulo"><input type="text" name="descripcion" placeholder="descripcion"><select name="dificultad"><option value="1">facil</option><option value="2">media</option><option value="3">dificil</option></select><input type="date" name="plazo"><input type="submit"></form>');  
          }
         
      });
      $(".tareas-wrap").on('submit', '.form-editar-tarea', function (e) {
          e.preventDefault();
          $.ajax({
              url:'index.php?controller=tareas&action=ubyID',
              data:$(this).serialize(),
              method:'POST',
              success:function(datos){
                  
                  if(datos==1){
                     comprobarMisTareas();
                  }
              }
          });
         
      });
      });
function comprobarMisTareas(){
  
    $.ajax({
    url:"./index.php?controller=tareas&action=rself",
    success:function(tareas){        
        tarea=jQuery.parseJSON(tareas);     
            construirElemTareas(tarea);
        },
    error:function(){
        alert('algo no ha ido como debia');
    }
    
    
});

}

function construirElemTareas(tareas){
    $('.tareas-wrap').empty();
   tareas.forEach(function(tarea){
        $('.tareas-wrap').append('<li class="tarea-li"><div>'+tarea.titulo+ tarea.plazo+tarea.estado+'<span class="tarea-span"><i class="material-icons beditarTarea" idtarea="'+tarea.id+'">mode_edit</i><i class="material-icons">delete</i></span></div></li>');
   });
            
        }
        