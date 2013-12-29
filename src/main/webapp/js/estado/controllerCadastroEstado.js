function ControllerCadastroEstado($scope, $http, $rootScope) {
	
	ControllerCadastro($scope, $http, $rootScope);

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
    

    $scope.onChangePais = function() {
    	
    	if ($scope.model) {
    		$scope.model.pais = $scope.paisSelecionado;
    	}
    	
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
                Behavior.initCadastro($scope, $http);
			}).error(function(data, status, headers, config) {
	        	toastr.error(Constants.ERROR_WHEN_QUERYING + data);
	        	Behavior.unBlockForm();
			});
		
	},
	
    //INITIALIZATION
    
	$scope.findPaises(self);

}