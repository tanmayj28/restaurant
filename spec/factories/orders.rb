# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    dish_name Faker::Name.name
    dish_price "9.99"
    menu nil
    customer nil
  end
end
