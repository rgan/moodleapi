require 'factory_girl'

FactoryGirl.define do
  factory :manual_enrolment_type, :class => :enrolment_type do
    enrol_type "manual"
  end
end