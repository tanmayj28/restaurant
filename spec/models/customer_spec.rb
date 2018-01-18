require 'rails_helper'

RSpec.describe Customer, type: :model do
  context 'validation test' do 
    it 'is valid customer Object' do
      FactoryGirl.build(:customer).should be_valid 
    end

    it 'validates customer name presence nil' do
      FactoryGirl.build(:customer, name: nil).should_not be_valid 
    end   

    it 'validates customer phone presence true' do
      FactoryGirl.build(:customer, phone: nil).should_not be_valid 
    end

    it 'validates address presence true' do
      FactoryGirl.build(:customer, address: nil).should_not be_valid 
    end

    it 'validates no_of_people presence true' do
      FactoryGirl.build(:customer, no_of_people: nil).should_not be_valid 
    end
    
    it 'validates phone length between 10..15' do
      FactoryGirl.build(:customer, phone: "123456789").should_not be_valid 
    end

    it 'validates phone length between 10..15' do
      FactoryGirl.build(:customer, phone: "12345678910121415").should_not be_valid 
    end

    it 'validates no_of_people numericality' do
      FactoryGirl.build(:customer, no_of_people: "4.50").should_not be_valid 
    end
  end

  context 'assosiation test' do
    it 'should belongs to restaurant system' do
      restaurant = FactoryGirl.create(:restaurant_system)
      customer = FactoryGirl.create(:customer ,restaurant_system_id:restaurant.id)
      customer.restaurant_system_id.should eq restaurant.id
    end
  end

  context 'assosiation test' do
    it 'should has many invoices' do
      customerVar = FactoryGirl.create(:customer)
      invoice1 = FactoryGirl.create(:invoice, customer_id:customerVar.id)
      invoice2 = FactoryGirl.create(:invoice, customer_id:customerVar.id)
      invoice1.customer_id.should eq customerVar.id
      invoice2.customer_id.should eq customerVar.id
    end

    it 'should has many orders' do
      customerVar = FactoryGirl.create(:customer)
      order1 = FactoryGirl.create(:order, customer_id:customerVar.id)
      order2 = FactoryGirl.create(:order, customer_id:customerVar.id)
      order1.customer_id.should eq customerVar.id 
      order2.customer_id.should eq customerVar.id
    end

    it 'should not has unincluded invoices' do
      customerVar1 = FactoryGirl.create(:customer)
      customerVar2 = FactoryGirl.create(:customer)
      invoice1 = FactoryGirl.create(:invoice, customer_id:customerVar1.id)
      invoice2 = FactoryGirl.create(:invoice, customer_id:customerVar2.id)
      invoice1.customer_id.should eq customerVar1.id
      invoice1.customer_id.should_not eq customerVar2.id
      invoice2.customer_id.should eq customerVar2.id
      invoice2.customer_id.should_not eq customerVar1.id
    end

    it 'should not has unincluded orders' do
      customerVar1 = FactoryGirl.create(:customer)
      customerVar2 = FactoryGirl.create(:customer)
      order1 = FactoryGirl.create(:order, customer_id:customerVar1.id)
      order2 = FactoryGirl.create(:order, customer_id:customerVar2.id)
      order1.customer_id.should eq customerVar1.id
      order1.customer_id.should_not eq customerVar2.id 
      order2.customer_id.should eq customerVar2.id
      order2.customer_id.should_not eq customerVar1.id
    end
  end
end
