$(document).ready(function() {
	
});

function PaisController($scope) {

    //AJAX
    
	$scope.save = function() {
        Behavior.save($scope);
    };
    
    $scope.remove = function(o) {
    	Behavior.remove($scope,o);
    };
    
    $scope.find = function(o) {
    	Behavior.find(o);
    };
    
    $scope.loadModel = function(o) {
    	$scope.model(new Pais(o));
    };
    
    $scope.toJSON = function() {
		var pais = new Pais($scope.model());
		var json = ko.toJSON(pais);
		return json;
    };

    //BEHAVIOR
    
    $scope.cancel = function() {
    	Behavior.cancel();
    };
    
    $scope.novo = function() {
    	Behavior.novo();
    };
    
    $scope.edit = function(o) {
    	Behavior.edit(o);
    };

    //INITIALIZATION
    
    Behavior.init($scope);
    
}

