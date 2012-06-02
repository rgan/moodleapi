require 'spec_helper'

describe "user controller" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "GET /users" do
    user = FactoryGirl.build(:user)
    User.should_receive(:all).and_return([user])
    get "/users"
    last_response.status.should == 200
    last_response.headers["Content-Type"].should == "application/json;charset=utf-8"
    last_response.body.should == [user].to_json
  end

  describe "POST /users" do
    it "should return 401 if data is not valid" do
      post "/users", ""
      last_response.status.should == 400
    end

    it "should return 401 if required fields are absent" do
      post "/users", '{"username":"foo"}'
      last_response.status.should == 400
    end

    it "should save user if valid" do
      json = '{username":"foo","password":"ff","first_name":"foo","last_name":"bar","email":"foobar@localhost"}'
      mock_user = mock(:user, :valid? => true, :save => true, :url => "/users/1")
      mock_user.should_receive(:save)
      User.should_receive(:parse_json).with(json).and_return(mock_user)
      post "/users", json
      last_response.status.should == 201
      last_response['Location'] == "/users/1"
    end
  end
end