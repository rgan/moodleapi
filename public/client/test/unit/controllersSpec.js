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
  var $httpBackend, scope, $controller;
  
  beforeEach(inject(function(_$httpBackend_, $rootScope, _$controller_) {
    $httpBackend = _$httpBackend_;
	$controller = _$controller_;
	scope = $rootScope.$new();
  }));

  afterEach(function() {
     $httpBackend.verifyNoOutstandingExpectation();
     $httpBackend.verifyNoOutstandingRequest();
   });
	
  it('should invoke service to get all courses', function() {
	$httpBackend.expectGET('/courses').respond([{fullname: 'Foo'}]);
	var controller = $controller(CoursesCtrl, {$scope: scope});
	expect(scope.courses).toEqual([]);
	$httpBackend.flush();	
    expect(scope.courses.length).toBe(1);
  });

  it('should invoke service to save course', function() {
	var courseJson = {fullname : "foo"};
	$httpBackend.expectGET('/courses').respond([]);
	var controller = $controller(CoursesCtrl, {$scope: scope});
	$httpBackend.flush();
	
	$httpBackend.expectPOST('/courses', courseJson).respond(201, '')
	scope.save(courseJson);
	$httpBackend.flush();
	});
});

});
