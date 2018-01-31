/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
   $('.form-solicitar').submit(function(e){
       e.preventDefault();
       var form=$(this);
       $.ajax({
           url:'index.php?controller=proyecto&action=solicitar',
           data:form.serialize(),
           method:'GET',
           success:function(datos){
               console.log(datos);
               if(datos!=0){
                   alertify.success('solicitud enviada');
               }else{
                    alertify.error('error inseperado vuelva a intentarlo mas adelante');
               }
               
           },
           error: function(){
               alertify.error('error inseperado vuelva a intentarlo mas adelante');
           }
       });
   }) ;
});