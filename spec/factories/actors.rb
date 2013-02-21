# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :actor do
    name "Bill Murray"
    birth_date "2013-02-20"
    gender "male"
  end
end
