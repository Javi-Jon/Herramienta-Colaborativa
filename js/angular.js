/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 
      $('fieldset').toggle( "drop" );
      idproyecto=$('[name="idproyecto"]').val();
     
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

/* *********************************************
             Subir archivos
********************************************* */
$("#upload").dropzone({
    url: "index.php?controller=archivo&action=nArch&idProyecto=" + idproyecto,
    method: "post",
    clickable: "#upload",
    paramName: "userfile",
    success: function(file, response){
        alertify.success('as');
        console.log(response);
    },
    error: function(file, response){
        alertify.error("error: " +response);
    },

    previewTemplate:'<div class="dz-preview dz-file-preview"><div class="dz-details"><div class="dz-filename"><span data-dz-name></span></div><div class="dz-size" data-dz-size></div>    <img data-dz-thumbnail />  </div></div>',
    uploadprogress: function(file, progress, bytesSent) {
        if (file.previewElement) {
            $('.dz-upload').css('width',progress + "%") ;
            //$('.dz-progress').querySelector(".progress-text").textContent = progress + "%";
        }
    }
});

/* *********************************************
              Fin subir archivos
********************************************* */

//('#div-archivos').dropzone(
//        {url:'./index.php',
//    options:[{
//     addedfile: function(file) {
//    file.previewElement = $('#div-archivos').append('<p>'+file.name+'</p>\n\
//<div class="progreso"></div>');},
//uploadprogress: function(file, progress, bytesSent) {
//    $('.progreso').progressbar({
//      value: bytesSent
//    })}       
//            
//    }]});
    



//$('#div-archivos').options = {
// 
//  // Specifing an event as an configuration option overwrites the default
//  // `addedfile` event handler.
//  addedfile: function(file) {
//    file.previewElement = $('#div-archivos').createElement(this.options.previewTemplate);
//    // Now attach this new element some where in your page
//  },
//  thumbnail: function(file, dataUrl) {
//    // Display the image in your file.previewElement
//  },
//  uploadprogress: function(file, progress, bytesSent) {
//    // Display the progress
//  }
//  // etc...
//};



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
            form.next().before('<div class="comentario card"><span>'+$('[name="mensaje"]').val()+'</span><span></span><span>ahora mismo</span></div>');
            form[0].reset();
        },
        error: function () {
              alertify.error("Error log message");
            }
    });

});
$('#abrir').click(function(){
    $('fieldset').toggle( "drop" );
}) ;
$('#adm-participantes').click(function(){
    idproyecto=$('[name="idproyecto"').val();
    $('#adm-participantes-modal').modal('show');
});
$('#bfinalizar').click(function(){
    $('#adm-participantes-modal').modal('hide');
});


$('.aceptar-solicitud').submit(function(e){
    e.preventDefault();
var datos=$(this).serialize();
  $.ajax({
      url:'index.php?controller=proyecto&action=aceptar',
      data:datos,
      success:function(datos){
          console.log(datos);
      }
  });
});

$('.rechazar-solicitud').submit(function(e){

    e.preventDefault();
var datos=$(this).serialize();
  $.ajax({
      url:'index.php?controller=proyecto&action=rechazar',
      data:datos,
      success:function(datos){
          console.log(datos);
      }
  });
});
});
