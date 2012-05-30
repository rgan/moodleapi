require 'factory_girl'

FactoryGirl.define do
  factory :course do
    fullname "Intro to Programming"
    shortname "Programming 101"

    factory :course_with_enrolments, :class => :course do

      after(:build) do |course, evaluator|
        enrolment_type = FactoryGirl.build(:manual_enrolment_type, :course => course)
        first_enrolment = Enrolment.new(:enrolment_type => enrolment_type, :user => FactoryGirl.create(:user))
        second_enrolment = Enrolment.new(:enrolment_type => enrolment_type, :user => FactoryGirl.create(:user))
        enrolment_type.enrolments = [first_enrolment, second_enrolment]
        course.enrolment_types << enrolment_type
      end
    end
  end
end