$(document).ready(function(){
    $('#subm-newProy').click(function(e){
        e.preventDefault();
        
        $.ajax({
            url:"../index.php?controller=proyecto&action=c",
            method:'POST',
            data:$('#newProy').serialize(),
            success:function(data){
                $('#proyect-modal').modal("hide");
                $('#participantes-modal').modal("show");
            },
            ajaxError:function(){
                alert('algo no ha ido como debia');
            }
        });
    });
});
