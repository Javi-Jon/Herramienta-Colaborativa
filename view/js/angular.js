/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

lista=[{index:0,fullname:'yo'}];
//    $.ajax({                url:'../index.php?controller=usuario&action=rself',
//                     success:function(dato){
//                         console.log(dato);
//                       x=jQuery.parseJSON(dato);
//                       
//                        $scope.lista[x];
//                        console.log('asdasd');
//                    },
//                    ajaxError:function(){
//                alert('algo no ha ido como debia');
//            }
//                });

	

	  function getTotal () {
    return lista.length;
  };

	
            
            //$scope.lista.push({id:$scope.getTotal(),fullname:$scope.txtnombre});
//		$scope.txtnombre='';		

	function borrar($index){
		lista.splice($index,1);
	};



