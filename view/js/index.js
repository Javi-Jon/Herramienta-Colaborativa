
function comprobarMisTareas(){$.ajax({
    url:"../index.php?controller=tareas&action=rself",
    success:function(tareas){
        console.log(tareas);
        return tareas;s
    }
    
});}
tareas=comprobarMisTareas();

$(document).ready(function(){
    $('#subm-newProy').click(function(e){
        e.preventDefault();
        
        $.ajax({
            url:"../index.php?controller=proyecto&action=c",
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
                    url:'../index.php?controller=proyecto&action=ap&idproyecto='+idproyecto,
                    method:'POST',
                    data:$('#formuser').serialize(),                    
                     success:function(dato){
                         console.log(dato);
                         if(dato==='error'){
                             alert('error1');
                             
                         }else{
              
                        persona = jQuery.parseJSON(dato);
                        console.log(persona);
                        $('#participantes').append("<li  class='alert alert-success'>"+persona[0].fullname+" <button class='bborrar' idpart='"+persona.participacionID+"'>X</button></li>")
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
            url:'../index.php?controller=proyecto&action=dp&idpart='+$(this).attr('idpart'),
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
});
