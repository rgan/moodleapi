require 'spec_helper'

describe 'enrolment' do

  before(:each) do
    Enrolment.all.destroy
    EnrolmentType.all.destroy
    Course.all.destroy
    User.all.destroy
  end

  it "should be associated with a user and course via enrolment_type" do
    course = FactoryGirl.create(:course)
    user = FactoryGirl.create(:user)
    enrolment_type = FactoryGirl.create(:manual_enrolment_type, :course => course)
    enrolment = Enrolment.new(:enrolment_type => enrolment_type, :user => user)
    enrolment.save
    Course.first.enrolment_types.first.enrolments.should == [enrolment]
  end

  it "should return enrolments for course" do
    enrolment_type = FactoryGirl.create(:manual_enrolment_type, :course => FactoryGirl.create(:course))
    enrolment = Enrolment.create(:enrolment_type => enrolment_type, :user => FactoryGirl.create(:user))
    second_enrolment = Enrolment.create(:enrolment_type => enrolment_type, :user => FactoryGirl.create(:user))
    Course.first.enrolments.should == [enrolment, second_enrolment]
  end

  it "should return courses for a user" do
    course = FactoryGirl.create(:course)
    enrolment_type = FactoryGirl.create(:manual_enrolment_type, :course => course)
    Enrolment.create(:enrolment_type => enrolment_type, :user => FactoryGirl.create(:user))
    User.first.courses.should == [course]
  end
end