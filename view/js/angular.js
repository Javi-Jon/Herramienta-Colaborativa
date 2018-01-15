/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function ctrl($scope) {

	$scope.lista=[
	{id:0,nombre:'javer'},
	{id:1,nombre:'anselmo'}];

	 $scope.getTotal = function () {
    return $scope.lista.length;
  };

	$scope.anadir=function() {		
		$scope.lista.push({id:$scope.getTotal(),nombre:$scope.txtnombre});
		$scope.txtnombre='';		
	};
	$scope.borrar=function($index){
		$scope.lista.splice($index,1);
	};
}




