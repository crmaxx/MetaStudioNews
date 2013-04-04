# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :news do
    title "MyString"
    body "MyText"
    user_id "MyString"
  end
end
