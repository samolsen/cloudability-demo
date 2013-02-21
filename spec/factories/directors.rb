# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :director do
    name { Faker::Name.name }
    birth_date "2013-02-20"
    gender "female"
    
    factory :director_with_dvds do 
      ignore do
        number_of_dvds 10
      end
      
      after(:create) do |director, evaluator|
        director.dvds = FactoryGirl.create_list(:dvd, evaluator.number_of_dvds)
      end
    end
  end
end
