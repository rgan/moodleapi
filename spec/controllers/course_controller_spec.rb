require 'spec_helper'

describe "course controller" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "GET /courses" do
    course = FactoryGirl.build(:course)
    Course.should_receive(:all).and_return([course])
    get "/courses"
    last_response.status.should == 200
    last_response.headers["Content-Type"].should == "application/json;charset=utf-8"
    last_response.body.should == [course].to_json
  end

  describe "POST /courses" do
    it "should return 401 if data is not valid" do
      post "/courses", ""
      last_response.status.should == 401
    end

    it "should return 401 if required fields are absent" do
      post "/courses", '{"fullname":"foo", "shortname":""}'
      last_response.status.should == 401
      last_response.body.should == "[\"Shortname must not be blank\", \"Shortname must be between 1 and 255 characters long\"]"
    end

    it "should save course if valid" do
      json = '{"fullname":"foo", "shortname":"f"}'
      mock_course = mock(:course, :valid? => true, :save => true, :url => "/courses/1")
      mock_course.should_receive(:save)
      Course.should_receive(:parse_json).with(json).and_return(mock_course)
      post "/courses", json
      last_response.status.should == 201
      last_response['Location'] == "/courses/1"
    end
  end
end