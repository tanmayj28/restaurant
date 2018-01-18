# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    name Faker::Name.name
    phone Faker::PhoneNumber.cell_phone
    address Faker::Address.street_address
    no_of_people 1
    restaurant_system nil
  end
end
