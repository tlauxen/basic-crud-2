function ControllerListagem($scope, $http) {

	configureControllerCadastro($scope, $http);
	
    //INITIALIZATION
    
    Behavior.initListagem($scope, $http);

}

function configureControllerCadastro($scope, $http) {

	$scope.filter = {};
	
    //AJAX
    
    $scope.remove = function(o) {
    	Behavior.remove($scope, $http,o);
    };
    
    $scope.find = function() {
    	Behavior.find($scope, $http);
    };
    
    //BEHAVIOR
    
    $scope.novo = function() {
    	Behavior.novo();
    };
    
    $scope.edit = function(o) {
    	Behavior.edit(o);
    };

}
