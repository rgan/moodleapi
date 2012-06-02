'use strict';

/* Controllers */


function UsersCtrl($scope, User) {
	$scope.users = User.all();
}
UsersCtrl.$inject = ['$scope', 'User'];


function CoursesCtrl($scope, Course) {
	$scope.courses = Course.all();
	$scope.save = function(course) {
	    Course.save(angular.copy(course), function() { $scope.status = 'Saved'}, function() {$scope.status = 'Error'});
	};
}
CoursesCtrl.$inject = ['$scope', 'Course'];
