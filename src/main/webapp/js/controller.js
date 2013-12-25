function Controller($scope, $http) {

	
	$scope.filter = {};
	
    //AJAX
    
	$scope.save = function() {
        Behavior.save($scope, $http);
    };
    
    $scope.remove = function(o) {
    	Behavior.remove($scope, $http,o);
    };
    
    $scope.find = function() {
    	Behavior.find($scope, $http);
    };
    
    $scope.doLoad = function(data) {
    	
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
    
    Behavior.init($scope, $http);

}