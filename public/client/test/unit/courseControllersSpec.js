'use strict';

describe('CoursesCtrl', function(){
  var $httpBackend, scope, $controller;
  
  beforeEach(module('moodleApp.services'));
 
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

