# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test_#{n}@genderoverflow.com" }
    password { ::TEST_PASSWORD }
    password_confirmation { ::TEST_PASSWORD }
  end
end
