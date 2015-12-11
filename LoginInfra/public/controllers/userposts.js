var app = angular.module('userposts', []);
app.controller("userpostsController", userpostsController);
userpostsController.$inject = [ '$scope', '$http', '$window'];
function userpostsController($scope, $http, $window) {
	$http({
		method : 'GET',
		url : '/userposts',
		data : {
		}
	}).success(function(response) {
		if (response.Status != "Error") {			
			$scope.Posts = [];
			$scope.count = 0;
			angular.forEach(response.Posts,function(value, key){
				var post = value;
				if(!(post.IMAGEFILE && post.IMAGEFILE != null && post.IMAGEFILE != undefined && post.IMAGEFILE!='undefined')){
					post.IMAGEFILE = "/design/Placeholder.png";
				}else{
					post.IMAGEFILE = "/Image?image="+post.IMAGEFILE;
					
				}
				$http({
					method : 'POST',
					url : '/getcomments',
					data : {
						"post_id": post.ID
					}
				}).success(function(response) {
					
					if(response.Status != "Error"){
						post.COMMENTS = response.Comments;
					}else{
						console.log('No Comments Returned');
					}
				}).error(function(error) {
					console.log('error');
				});
				
				$http({
					method : 'POST',
					url : '/getupvotes',
					data : {
						"request_id": post.ID
					}
				}).success(function(response) {
					
					if(response.result != "failure"){
						post.upvotes = response.upvotes;
					}else{
						post.upvotes = {count : 0, upvoted : 0};
						console.log('No upvotes Returned');
					}
				}).error(function(error) {
					console.log('error');
				});				
				
				$scope.Posts.push(post);				
			})
			
		} else {
			console.log("error");
		}			
	}).error(function(error) {
		console.log(error);
	});
	
	
	$scope.postcomment = function(postindex, comment_text){
		console.log($scope.Posts[postindex].ID);
		$http({
			method : 'POST',
			url : '/insertcomments',
			data : {
				"post_id": $scope.Posts[postindex].ID,
				"comment_txt" : comment_text
			}
		}).success(function(response) {
			if (response.Status != "Error") {
				if($scope.Posts[postindex].COMMENTS && $scope.Posts[postindex].COMMENTS != null && $scope.Posts[postindex].COMMENTS != undefined && $scope.Posts[postindex].COMMENTS!='undefined'){
					$scope.Posts[postindex].COMMENTS.push(response.Comment);
					$comment = '';
				}else{
					$scope.Posts[postindex].COMMENTS = [];
					$scope.Posts[postindex].COMMENTS.push(response.Comment);
				}
			} else {
				console.log("error");
			}			
		}).error(function(error) {
			console.log(error);
		});
	}
	
	$scope.upvote = function(postindex){
		console.log($scope.Posts[postindex].ID);
		$http({
			method : 'POST',
			url : '/addupvotes',
			data : {
				"request_id": $scope.Posts[postindex].ID
			}
		}).success(function(response) {
			if (response.result == "success") {
				console.log('sucess');
				console.log($scope.Posts[postindex]);
				$scope.Posts[postindex].upvotes.count++;
			} else {
				console.log("error");
			}			
		}).error(function(error) {
			console.log(error);
		});
	}
	
	
	
}