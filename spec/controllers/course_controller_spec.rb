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

  describe "GET /courses/:id/enrolments" do
    it "should return 404 not found" do
      Course.should_receive(:get).and_return(nil)
      get "/courses/1/enrolments"
      last_response.status.should == 404
    end

    it "should return enrolments" do
      course = FactoryGirl.build(:course_with_enrolments)
      Course.should_receive(:get).with(1).and_return(course)
      get "/courses/1/enrolments"
      last_response.status.should == 200
      last_response.headers["Content-Type"].should == "application/json;charset=utf-8"
      last_response.body.should == course.enrolments.to_json
    end
  end

  describe "POST /courses" do
    it "should return error if data is not valid" do

    end
  end
end