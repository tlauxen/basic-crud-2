function ControllerCadastroCidade($scope, $http, $rootScope) {
	
	ControllerCadastro($scope, $http, $rootScope);

    $scope.doLoad = function(data) {
    	$.each($scope.estados, 
        		function() {
        			if (this.id == data.estado.id) {
        				$scope.estadoSelecionado = this;
        				return false;
        			}
        		}
        	);
    };
    

    $scope.onChangeEstado = function() {
    	
    	if ($scope.model) {
    		$scope.model.estado = $scope.estadoSelecionado;
    	}
    	
    };

	//AJAX find by filter and reload list
    $scope.findEstados = function(viewModel) {

		var path = Behavior.getContextPath();
		Behavior.blockForm();
		path += "/estado/ajax/find";

		$http.post(path,{})
			.success(function(data) {
				$scope.estados = data;
				Behavior.unBlockForm();
                Behavior.initCadastro($scope, $http);
			}).error(function(data, status, headers, config) {
	        	toastr.error(Constants.ERROR_WHEN_QUERYING + data);
	        	Behavior.unBlockForm();
			});
		
	},
	
    //INITIALIZATION
    
	$scope.findEstados(self);

}