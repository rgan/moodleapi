require 'spec_helper'

describe "course controller" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "/courses" do
    course = FactoryGirl.build(:course)
    Course.should_receive(:all).and_return([course])
    get "/courses"
    last_response.status.should == 200
    last_response.headers["Content-Type"].should == "application/json;charset=utf-8"
    last_response.body.should == [course].to_json
  end

  it "/courses/:id/enrolments" do
    course = FactoryGirl.build(:course_with_enrolments)
    Course.should_receive(:get).with(1).and_return(course)
    get "/courses/1/enrolments"
    last_response.status.should == 200
    last_response.headers["Content-Type"].should == "application/json;charset=utf-8"
    last_response.body.should == course.enrolments.to_json
  end
end