require 'faker'

FactoryGirl.define do
  factory :word do
    name { Faker::Address.country }
    category
  end
end
