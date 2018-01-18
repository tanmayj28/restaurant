# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :restaurant_system do
    name Faker::Name.name
    phone Faker::PhoneNumber.cell_phone
    address Faker::Address.street_address
  end
end
