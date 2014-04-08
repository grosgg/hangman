FactoryGirl.define do
  factory :category do
    sequence(:name) { |n| "Example category #{n}" }
  end
end
