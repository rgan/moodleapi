'use strict';

angular.module('moodleApp', ['moodleApp.services']).
  config(['$routeProvider', function($routeProvider) {
    $routeProvider.when('/users', {template: 'partials/users.html', controller: UsersCtrl});
    $routeProvider.when('/courses', {template: 'partials/courses.html', controller: CoursesCtrl});
    $routeProvider.when('/courses/add', {template: 'partials/addCourse.html', controller: CoursesCtrl});
    $routeProvider.when('/users/add', {template: 'partials/addUser.html', controller: UsersCtrl});
    $routeProvider.otherwise({redirectTo: '/users'});
  }]);
