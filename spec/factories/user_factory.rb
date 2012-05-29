require 'factory_girl'
require 'faker'

FactoryGirl.define do
  factory :user do
    username { Faker::Name.last_name }
    password "foobar"
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
  end
end