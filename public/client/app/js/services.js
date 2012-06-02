'use strict';

/* Services */

var serviceModule = angular.module('moodleApp.services', ['ngResource'])

serviceModule.factory('User', function($resource){
  return $resource('/users', {}, {
    all: {method:'GET', params:{}, isArray:true},
    save: {method:'POST'}
  });
});

serviceModule.factory('Course', function($resource){
  return $resource('/courses', {}, {
    all: {method:'GET', params:{}, isArray:true},
	save: {method:'POST'}
  });
});
