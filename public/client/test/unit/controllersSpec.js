'use strict';

/* jasmine specs for controllers go here */
describe('Controllers', function() {
	
beforeEach(module('moodleApp.services'));

describe('UsersCtrl', function(){
  var scope, ctrl, $httpBackend;

  beforeEach(inject(function(_$httpBackend_, $rootScope, $controller) {
      $httpBackend = _$httpBackend_;
      $httpBackend.expectGET('/users').
          respond([{first_name: 'Foo'}]);

      scope = $rootScope.$new();
      ctrl = $controller(UsersCtrl, {$scope: scope});
    }));

  it('should invoke service to get all users', function() {
	expect(scope.users).toEqual([]);
	$httpBackend.flush();	
    expect(scope.users.length).toBe(1);
  });
});

describe('CoursesCtrl', function(){
  var scope, ctrl, $httpBackend;

  beforeEach(inject(function(_$httpBackend_, $rootScope, $controller) {
      $httpBackend = _$httpBackend_;
      $httpBackend.expectGET('/courses').
          respond([{fullname: 'Foo'}]);

      scope = $rootScope.$new();
      ctrl = $controller(CoursesCtrl, {$scope: scope});
    }));

  it('should invoke service to get all courses', function() {
	expect(scope.courses).toEqual([]);
	$httpBackend.flush();	
    expect(scope.courses.length).toBe(1);
  });
});

});
