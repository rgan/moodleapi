describe('UsersCtrl', function(){
  var scope, ctrl, $httpBackend;

  beforeEach(module('moodleApp.services')); 

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

 it('should invoke service to save user', function() {
	userJson = {username: "foo"}
	
	$httpBackend.flush();	
	$httpBackend.expectPOST('/users', userJson).respond(201, '')
	scope.save(userJson);
	$httpBackend.flush();
  });
});
