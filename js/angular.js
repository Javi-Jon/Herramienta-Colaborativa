/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 
      $('fieldset').toggle( "drop" );
      
     
$(document).ready(function(){
    
    
    $('#formAsign').validetta({
        realTime : true,
        display:'bubble',
         bubblePosition: 'right', // Bubble position // right / bottom
  bubbleGapLeft: 50,
     onValid : function() {
            event.preventDefault();
    //      $('#formAsign').submit(function(e){
//       e.preventDefault();
      var data=$('#formAsign').serialize();
      $.ajax({
          url: "./index.php?controller=tareas&action=assign",
          method:'POST',
          data:data,
          success:function(dato){
              $('#asignaciones-modal').modal('hide');
          }
      });
//    $(this)[0].reset(); 
//});
     }});

    $('#tabs').tabs({
  heightStyle: "auto"
  
});





$('#formNuevaTarea').validetta({
        realTime : true,
        display:'inline',
         bubblePosition: 'right', // Bubble position // right / bottom
  bubbleGapLeft: 50,
     onValid : function() {
            event.preventDefault();
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
                alertify.error("Error log message");
               }
                
            },
             error: function () {
              alertify.error("Error log message");
            }
        });
     }});







//    $('#banadirTarea').click(function(){
//        
//        
//     var titulo=  $('#formNuevaTarea [name="titulo"]').val();
//        var tarea=$('#formNuevaTarea').serialize();
//        $.ajax({
//            url:'index.php?controller=tareas&action=ct',
//            data: tarea,
//            method:'POST',
//            success:function(data){
//               if(data!==0){
//                   console.log(data);
//                   $('#asignaciones-modal .modal-title').html(titulo); 
//                   $('#formNuevaTarea')[0].reset();
//                   $('[name="idtarea"]').val(data);
//                   $('#tareas-proyecto').append('<li>'+titulo+'</li>');
//                   $('#asignaciones-modal').modal('show');                   
//         
//               }else{
//                alertify.error("Error log message");
//               }
//                
//            },
//             error: function () {
//              alertify.error("Error log message");
//            }
//        });
//
//    });
//    
//    
//    $('#formAsign').submit(function(e){
//       e.preventDefault();
//      var data=$(this).serialize();
//      $.ajax({
//          url: "./index.php?controller=tareas&action=assign",
//          method:'POST',
//          data:data,
//          success:function(dato){
//              $('#asignaciones-modal').modal('hide');
//          }
//      });
//    $(this)[0].reset(); 
//});
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
        },
        error: function () {
              alertify.error("Error log message");
            }
    });
   
});
$('#abrir').click(function(){
    $('fieldset').toggle( "drop" )
}) ;
$('#adm-participantes').click(function(){
    $('#adm-participantes-modal').modal('show');
});

});
