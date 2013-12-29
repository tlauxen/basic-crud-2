function ControllerCadastro($scope, $http, $rootScope) {

    //AJAX
    
	$rootScope.save = function() {
        Behavior.save($scope, $http);
    };
    
    //BEHAVIOR
    
    $rootScope.cancel = function() {
    	Behavior.cancel();
    };
    
    $rootScope.edit = function(o) {
    	Behavior.edit(o);
    };

    //INITIALIZATION
    
    Behavior.initCadastro($scope, $http);
    
}
