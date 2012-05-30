require 'spec_helper'

describe 'enrolment_type' do

  before(:each) do
    Enrolment.all.destroy
    EnrolmentType.all.destroy
    Course.all.destroy
    User.all.destroy
  end

  it "should be associated with a course" do
    course = FactoryGirl.create(:course)
    enrolment_type = FactoryGirl.create(:manual_enrolment_type, :course => course)
    course.enrolment_types.should == [enrolment_type]
  end

end