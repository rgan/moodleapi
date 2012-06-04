'use strict';

/* Controllers */


function UsersCtrl($scope, User) {
	$scope.users = User.all();
	$scope.save = function(user) {
	    User.save(angular.copy(user), function() { $scope.status = 'Saved'}, function() {$scope.status = 'Error'});
	};
}
UsersCtrl.$inject = ['$scope', 'User'];


function CoursesCtrl($scope, Course) {
	$scope.courses = Course.all();
	$scope.save = function(course) {
	    Course.save(angular.copy(course), function() { $scope.status = 'Saved'}, function() {$scope.status = 'Error'});
	}; 
}
CoursesCtrl.$inject = ['$scope', 'Course'];

function EnrolmentsCtrl($scope, $routeParams, Enrolment, User) {
	$scope.courseName = $routeParams.courseName
	$scope.courseId = $routeParams.courseId
	$scope.users = User.all();
	$scope.enrolments = Enrolment.all({courseId: $routeParams.courseId})
	$scope.enrol = function(userId) {
		Enrolment.save({courseId: $routeParams.courseId}, '{"userid" : "' + userId + '"}', 
			function() { $scope.status = 'Saved'}, function() {$scope.status = 'Error'})
	}
}

EnrolmentsCtrl.$inject = ['$scope', '$routeParams', 'Enrolment', 'User'];
