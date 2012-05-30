require 'data_mapper'

class User
  include DataMapper::Resource

  storage_names[:default] = 'mdl_user'

  property :id, Serial, :field => 'id'
  property :username, String, :required => true, :length => 1..100
  property :password, String, :required => true, :length => 1..32
  property :first_name, String, :field => 'firstname', :required => true, :length => 1..100
  property :last_name, String, :field => 'lastname', :required => true, :length => 1..100
  property :email, String, :required => true, :length => 1..100

  has n, :enrolments, :child_key => 'userid'

  def courses
     enrolments.collect { | enrolment| enrolment.enrolment_type.course }
  end

  def url
    "/users/#{self.id}"
  end
end