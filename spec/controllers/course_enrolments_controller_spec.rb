require 'spec_helper'

describe "course controller" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "GET /courses/:id/enrolments" do
    it "should return 404 not found" do
      Course.should_receive(:get).and_return(nil)
      get "/courses/1/enrolments"
      last_response.status.should == 404
    end

    it "should return enrolments" do
      course = FactoryGirl.create(:course_with_enrolments)
      Course.should_receive(:get).with(1).and_return(course)
      get "/courses/1/enrolments"
      last_response.status.should == 200
      last_response.headers["Content-Type"].should == "application/json;charset=utf-8"
      last_response.body.should == course.enrolled_users.to_json
    end

  end

  describe "POST /courses/:id/enrolments" do
    it "should return 404 not found" do
      Course.should_receive(:get).and_return(nil)
      post "/courses/1/enrolments"
      last_response.status.should == 404
    end

    it "should return 401 if json is invalid" do
      json = ''
      course = mock(:course)
      Course.should_receive(:get).with(1).and_return(course)
      Enrolment.should_receive(:parse_json).with(json).and_raise("error")
      post "/courses/1/enrolments", json
      last_response.status.should == 401
    end

    it "should enrol user" do
      json = '{"userid" : "1"}'
      enrolment = mock(:enrolment, :url => "/courses/1/enrolments/1")
      Enrolment.should_receive(:parse_json).with(json).and_return(enrolment)
      course = mock(:course)
      Course.should_receive(:get).with(1).and_return(course)
      course.should_receive(:add_enrolment).with(enrolment)
      post "/courses/1/enrolments", json
    end
  end
end

