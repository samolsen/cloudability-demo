# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :dvd do
    name { Faker::Lorem.words(4).join(' ') }
    release_date "2013-02-20"
    summary "It's the end of the world. And Bill Murray."
    asin "B002WY65VU"
    
    
    factory :dvd_with_cast do 
      ignore do
        cast_size 10
      end
      
      after(:create) do |dvd, evaluator|
        dvd.actors = FactoryGirl.create_list(:actor, evaluator.cast_size)
      end
    end
  
  end
end