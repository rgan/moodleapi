'use strict';

/* Controllers */


function UsersCtrl($scope, User) {
	$scope.users = User.all();
}
UsersCtrl.$inject = ['$scope', 'User'];


function CoursesCtrl($scope, Course) {
	$scope.courses = Course.all();
}
CoursesCtrl.$inject = ['$scope', 'Course'];
