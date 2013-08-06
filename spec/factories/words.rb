require 'faker'

FactoryGirl.define do
  factory :word do |f|
    f.name { Faker::Address.country }
  end
end
