require 'factory_girl'
FactoryGirl.define do
  factory :user do
    name "Jururu"
    sequence(:email) {|n| "jururu#{n}@example.org"}
    password "test"
  end
end

