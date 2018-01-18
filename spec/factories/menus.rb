# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :menu do
    dish_name Faker::Name.name
    dish_description Faker::Name.name
    dish_price "9.99"
    restaurant_system nil
  end
end
