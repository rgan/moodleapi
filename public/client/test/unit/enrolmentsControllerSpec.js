'use strict';

describe('EnrolmentsCtrl', function(){
  var $httpBackend, scope, $controller;
  
  beforeEach(module('moodleApp.services'));
 
  beforeEach(inject(function(_$httpBackend_, $rootScope, _$controller_) {
    $httpBackend = _$httpBackend_;
	$controller = _$controller_;
	scope = $rootScope.$new();
	$httpBackend.expectGET('/users').respond([{first_name: 'Foo'}]);
	$httpBackend.expectGET('/courses/1/enrolments').respond([{first_name: 'Foo'}]);
  }));

  afterEach(function() {
     $httpBackend.verifyNoOutstandingExpectation();
     $httpBackend.verifyNoOutstandingRequest();
   });

 it('should invoke service to get all users', function() {
	var controller = $controller(EnrolmentsCtrl, {$scope: scope, $routeParams: {courseId: 1}});
	expect(scope.users).toEqual([]);
	$httpBackend.flush();	
    expect(scope.users.length).toBe(1);
  });

 it('should invoke service to get all enrolments', function() {
	var controller = $controller(EnrolmentsCtrl, {$scope: scope, $routeParams: {courseId: 1}});
	expect(scope.enrolments).toEqual([]);
	$httpBackend.flush();	
    expect(scope.enrolments.length).toBe(1);
  });

  it('should invoke service to enrol user', function() { 
	var controller = $controller(EnrolmentsCtrl, {$scope: scope, $routeParams: {courseId: 1}});

	$httpBackend.expectPOST('/courses/1/enrolments', '{"userid" : "1"}').respond(201, '')
	scope.enrol(1);
	$httpBackend.flush();
	});
});
