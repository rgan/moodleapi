require 'spec_helper'

describe "Course" do

  before(:each) do
    Course.all.destroy
  end

  it "should create a course" do
    course = FactoryGirl.build(:course)
    expect {
      course.save
    }.to change(Course, :count).by(1)
  end

  describe "validations" do
    it "should be valid" do
      FactoryGirl.build(:course).should be_valid
    end

    it "should require fullname" do
      course = FactoryGirl.build(:course)
      course.fullname = nil
      course.should_not be_valid
    end
  end

  it "should create a course from json" do
    course = Course.parse_json('{"id":1,"fullname":"Test University","shortname":"TestUniv","summary":"summary"}')
    course.fullname.should == "Test University"
    course.shortname.should == "TestUniv"
    course.summary.should == "summary"
  end

  it "should return url" do
    course = FactoryGirl.create(:course)
    course.url.should == "/courses/#{course.id}"
  end
end