# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invoice do
    dish_name Faker::Name.name
    dish_price "9.99"
    total "9.99"
    restaurant_system nil
    customer nil
    order nil
  end
end
