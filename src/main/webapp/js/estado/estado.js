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
    	$.each($scope.paises, 
        		function() {
        			if (this.id == data.pais.id) {
        				$scope.paisSelecionado = this;
        				return false;
        			}
        		}
        	);
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
    
    $scope.onChangePais = function() {
    	
    	$scope.model.pais = $scope.paisSelecionado;
    	
    };

	//AJAX find by filter and reload list
    $scope.findPaises = function(viewModel) {

		var path = Behavior.getContextPath();
		Behavior.blockForm();
		path += "/pais/ajax/find";

		$http.post(path,{})
			.success(function(data) {
				$scope.paises = data;
				Behavior.unBlockForm();
                Behavior.init($scope, $http);
			}).error(function(data, status, headers, config) {
	        	toastr.error(Constants.ERROR_WHEN_QUERYING + data);
	        	Behavior.unBlockForm();
			});
		
	},
	
    //INITIALIZATION
    
	$scope.findPaises(self);
    //INITIALIZATION

}