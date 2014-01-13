function ControllerCadastroFeriado($scope, $http, $rootScope) {
	
	ControllerCadastro($scope, $http, $rootScope);

    $scope.doLoad = function(data) {
    	$.each($scope.abrangencias, 
        		function() {
        			if (this == data.tpAbrangencia) {
        				$scope.abrangenciaSelecionada = this;
        				return false;
        			}
        		}
        	);
    };
    

    $scope.onChangeAbrangencia = function() {
    	
    	if ($scope.model) {
    		$scope.model.tpAbrangencia = $scope.abrangenciaSelecionada;
    	}
    	
    };

    $scope.onChangePais = function() {
    	
    	if ($scope.model) {
    		$scope.model.pais = $scope.paisSelecionado;
    	}
    	
    };
    
    $scope.onChangeCidade = function() {
    	
    	if ($scope.model) {
    		$scope.model.cidade = $scope.cidadeSelecionada;
    	}
    	
    };
    
    $scope.onChangePeriodo = function() {
    	
    	if ($scope.model) {
    		$scope.model.tpPeriodo = $scope.periodoSelecionado;
    	}
    	
    };
    
	//AJAX find by filter and reload list
    $scope.findDadosIniciais = function() {

		var path = Behavior.getContextPath();
		Behavior.blockForm();
		path += "/feriado/ajax/findDadosIniciais";

		$http.post(path,{})
			.success(function(data) {
				$scope.abrangencias = data.abrangencias;
				$scope.paises = data.paises;
				$scope.cidades = data.cidades;
				$scope.periodos = data.periodos;
				Behavior.unBlockForm();
                Behavior.initCadastro($scope, $http);
			}).error(function(data, status, headers, config) {
	        	toastr.error(Constants.ERROR_WHEN_QUERYING + data);
	        	Behavior.unBlockForm();
			});
		
	};
	
	$scope.isAbrangenciaMunicipal = function() {
		return $scope.model.tpAbrangencia == 'MUNICIPAL';
	};
	
	$scope.isPeriodoFixo = function() {
		return $scope.model.tpPeriodo == 'FIXO';
	};
	
	$scope.isPeriodoVariavel = function() {
		return $scope.model.tpPeriodo == 'VARIAVEL';
	};
	
    //INITIALIZATION
    
	$scope.findDadosIniciais();

}