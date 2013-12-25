var Behavior = {
		
	//Initial things
	init: function($scope, $http) {
	    // Client-side routes
	    Sammy(function() {
	        this.get('#:id', function() {
	    		Behavior.load(this.params.id, $scope, $http);
	        });

	    }).run();
	},
	
	//NAVIGATION things
	
	//GOTO Create entity
	novo: function() {
		var path = Behavior.substringPath();
		path += Constants.CREATE_EDIT_PATH;
		window.location.href = path;
	},
	
	//GOTO edit entity
	edit: function(o) {
		var path = Behavior.substringPath();
		path += Constants.CREATE_EDIT_PATH+"/#"+o.id;
		window.location.href = path;
	},

	//GOTO Go back to the list
	cancel: function() {
		var path = Behavior.substringPath();
		path += Constants.LIST_PATH;
		window.location.href = path;
	},
	
	//AJAX things
	
	//AJAX load an entity by the ID
	load: function(id, $scope, $http) {
		var path = Behavior.substringPath();
		Behavior.blockForm();
		path += "/ajax/findById?id="+id;
		
		$http.get(path)
			.success(function(data) {
				$scope.model = data;
				$scope.doLoad(data);
				Behavior.unBlockForm();
			}).error(function(data, status, headers, config) {
				toastr.error(Constants.ERROR_WHEN_LOADING_ENTITY + data);
				Behavior.unBlockForm();
			});
		
	},
	
	//AJAX save an entity
	save: function($scope, $http) {

		var path = Behavior.substringPath();
		Behavior.blockForm();
		path += "/ajax/save";
		
		$http.post(path,$scope.model)
			.success(function(data) {
				$scope.model = data;
            	toastr.success(Constants.SUCCESS_SAVING_ENTITY);
				Behavior.unBlockForm();
			}).error(function(data, status, headers, config) {
	        	toastr.error(Constants.ERROR_WHEN_SAVING_ENTITY + data);
	        	Behavior.unBlockForm();
			});
		
	},
	
	//AJAX remove an entity
	remove: function($scope, $http, o) {

		var path = Behavior.substringPath();
		Behavior.blockForm();
		path += "/ajax/remove";

		$http.post(path,o)
			.success(function(data) {
            	toastr.success(Constants.SUCCESS_REMOVING_ENTITY);
            	Behavior.find($scope, $http);
			}).error(function(data, status, headers, config) {
	        	toastr.error(Constants.SUCCESS_REMOVING_ENTITY + data);
	        	Behavior.unBlockForm();
			});

	},
	
	//AJAX find by filter and reload list
	find: function($scope, $http) {

		var path = Behavior.substringPath();
		Behavior.blockForm();
		path += "/ajax/find";
		
		$http.post(path,$scope.filter)
			.success(function(data) {
				$scope.list = data;
				Behavior.unBlockForm();
			}).error(function(data, status, headers, config) {
	        	toastr.error(Constants.ERROR_WHEN_QUERYING + data);
	        	Behavior.unBlockForm();
			});

	},
	
	//COMMON functions
	
	//Retrive initial path from url
	substringPath: function() {
		var path = window.location.href;
		if (path.lastIndexOf(Constants.CREATE_EDIT_PATH) > -1) {
			path = path.substring(0, path.lastIndexOf(Constants.CREATE_EDIT_PATH));
		} else if (path.lastIndexOf(Constants.LIST_PATH) > -1) {
			path = path.substring(0, path.lastIndexOf(Constants.LIST_PATH));
		} else {
			path = path.substring(0, path.lastIndexOf("/"));
		}
		return path;
	},
	
	//Retrive initial path from url
	getContextPath: function() {
		var path = Behavior.substringPath();
		path = path.substring(0, path.lastIndexOf("/"));
		return path;
	},
	
	//Block form
	blockForm: function() {
		$('form').block({ message: '<img alt="'+Constants.WORKING+'..." src="'+Behavior.getContextPath()+Constants.LOADER_IMG+'"></img>',
			css: { 
	            border: 'none', 
	            padding: '15px', 
	            backgroundColor: '#000',
	            '-webkit-border-radius': '10px', 
	            '-moz-border-radius': '10px',
	            opacity: .5
        	},
        	overlayCSS: { opacity: 0 }
		});
	},
	
	//Unblock form
	unBlockForm: function() {
		$('form').unblock();
	}
	
};
