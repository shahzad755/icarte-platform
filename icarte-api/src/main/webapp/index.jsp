
<!DOCTYPE html>
<html data-ng-app="serviceModule">
<head>
<meta charset="ISO-8859-1">
<title>AngularJS POST Spring MVC</title>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>
 <script type="text/javascript">
 
	var serviceModule = angular.module('serviceModule', []);
	
	serviceModule.controller("AngularJSPostController", function($scope, $http) {
		
			$scope.variable = "AngularJS POST Spring MVC Example:";	
			var dataObj = {
					"restaurantId" : "1",
					"activationCode" : "12345656343434",
					"deviceId" : "1",
					"categoryId" : "1"
			};		
			
//			var response = $http.post('secure/listItems', dataObj);

			var response = $http.post('secure/postorder', dataObj);
			response.success(function(data, status, headers, config) {
				$scope.responseData = data;
			});
			response.error(function(data, status, headers, config) {
				alert( "Exception details: " + JSON.stringify({data: data}));
			});
		
	});

	
	

</script>

<!-- 
<script type="text/javascript">
 
	var serviceModule = angular.module('serviceModule', []);
	
	serviceModule.controller("AngularJSPostController", function($scope, $http) {
		
			$scope.variable = "AngularJS POST Spring MVC Example:";	
			var dataObj = {
					"restaurantId" : "1",
					"activationCode" : "12345656343434",
					"deviceId" : "1",
					"categoryId" : "1"
					
			};		
			
			var response = $http.post('secure/listItems', dataObj);
			response.success(function(data, status, headers, config) {
				$scope.responseData = data;
			});
			response.error(function(data, status, headers, config) {
				alert( "Exception details: " + JSON.stringify({data: data}));
			});
		
	});
	
</script>
 
 -->

</head>
<body data-ng-controller="AngularJSPostController"> 
  	{{responseData}}
</body>
</html>



