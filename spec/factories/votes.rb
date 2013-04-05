# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vote do
    vote 1
    user_id 1
    news_id 1
  end
end
