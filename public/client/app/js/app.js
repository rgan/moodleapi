'use strict';

angular.module('moodleApp', ['moodleApp.services']).
  config(['$routeProvider', function($routeProvider) {
    $routeProvider.when('/users', {template: 'partials/users.html', controller: UsersCtrl});
    $routeProvider.when('/courses', {template: 'partials/courses.html', controller: CoursesCtrl});
    $routeProvider.otherwise({redirectTo: '/users'});
  }]);
