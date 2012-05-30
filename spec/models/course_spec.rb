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
end