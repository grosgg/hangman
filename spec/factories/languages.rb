FactoryGirl.define do
  factory :language do
    sequence(:name) { |n| "Example language #{n}" }
  end
end
