# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :dvd do
    name "Zombieland"
    release_date "2013-02-20"
    summary "It's the end of the world. And Bill Murray."
    asin "B002WY65VU"
  end
end
