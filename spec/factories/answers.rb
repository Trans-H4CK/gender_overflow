# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    answer "MyText"
    question nil
    user nil
  end
end
