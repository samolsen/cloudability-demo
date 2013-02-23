# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :actor do
    name { Faker::Name.name }
    birth_date "2013-02-20"
    gender "male"
    
    factory :actor_with_roles do 
      ignore do
        number_of_roles 10
      end
      
      after(:build) do |actor, evaluator|
        actor.dvds = FactoryGirl.create_list(:dvd, evaluator.number_of_roles)
      end
    end
    
  end
end
