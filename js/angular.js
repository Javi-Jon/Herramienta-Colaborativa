/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 $('#formAsign').validetta({
        realTime : true
//        onValid : function( event ) {
//            event.preventDefault();
//            alert('bien');
////            $('#alert').empty()
////                .append('<div class="alert alert-success">Nice, Form is valid</div>');
//        },
//       
//            $('#alert').empty()
//                .append('<div class="alert alert-danger">Stop bro !! There are some errors.</div>');
//        }
    });
     
$(document).ready(function(){
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
    var datos=$(this).serialize();
    console.log(datos);
    var form=$(this);
    e.preventDefault();
    $.ajax({
        url:'index.php?controller=muro&action=cm',
        data: datos,
        method:'POST',
        success:function(data){
            console.log(data);
            form.append('<div class="comentario card">'+$('[name="mensaje"]').val()+'</div>');
        }
    });
   
});


});
