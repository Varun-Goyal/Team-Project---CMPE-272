var app = angular.module('contacts', []);
app.controller("contactsController", contactsController);
contactsController.$inject = [ '$scope', '$http', '$window'];
function contactsController($scope, $http, $window) {
	$http({
		method : 'POST',
		url : '/admincontacts',
		data : {
		}
	}).success(function(response) {
		if (response.Status != "Error") {
			console.log(response.Posts);
			$scope.contacts = [];
			angular.forEach(response.Contacts,function(value, key){
				console.log(value);
				$scope.contacts.push(value);				
			})			
		} else {
			console.log("error");
		}			
	}).error(function(error) {
		console.log(error);
	});
}