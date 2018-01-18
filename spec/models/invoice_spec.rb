require 'rails_helper'

RSpec.describe Invoice, type: :model do
  context 'validation test' do 
    it 'is valid invoice' do
      FactoryGirl.build(:invoice).should be_valid 
    end

    it 'should validate invoice dish_name presence nil' do
      FactoryGirl.build(:invoice, dish_name: nil).should_not be_valid 
    end   

    it 'should validate invoice dish_price presence true' do
      FactoryGirl.build(:invoice, dish_price: nil).should_not be_valid 
    end

    it 'should validate dish_price numericality more than 0' do
      FactoryGirl.build(:invoice, dish_price: -1234).should_not be_valid 
    end
    
    it 'should validate dish_price numericality less than 100000' do
      FactoryGirl.build(:invoice, dish_price: 989898989898).should_not be_valid 
    end   
  end 

  context 'assosiation test' do
    it 'should belongs to restaurant_system' do
      restaurant_system = FactoryGirl.create(:restaurant_system)
      invoice = FactoryGirl.create(:invoice ,restaurant_system_id:restaurant_system.id)
      invoice.restaurant_system_id.should eq restaurant_system.id
    end

    it 'should belongs to customer' do
      customer = FactoryGirl.create(:customer)
      invoice = FactoryGirl.create(:invoice ,customer_id:customer.id)
      invoice.customer_id.should eq customer.id
    end

    it 'should belongs to order' do
      order = FactoryGirl.create(:order)
      invoice = FactoryGirl.create(:invoice ,order_id:order.id)
      invoice.order_id.should eq order.id
    end

    it 'should not belongs to invalid restaurant_system' do
      restaurant_system1 = FactoryGirl.create(:restaurant_system)
      restaurant_system2 = FactoryGirl.create(:restaurant_system)
      invoice = FactoryGirl.create(:invoice ,restaurant_system_id:restaurant_system1.id)
      invoice.restaurant_system_id.should eq restaurant_system1.id
      invoice.restaurant_system_id.should_not eq restaurant_system2.id
    end

    it 'should not belongs to invalid customer' do
      customer1 = FactoryGirl.create(:customer)
      customer2 = FactoryGirl.create(:customer)
      invoice = FactoryGirl.create(:invoice ,customer_id:customer1.id)
      invoice.customer_id.should eq customer1.id
      invoice.customer_id.should_not eq customer2.id
    end

    it 'should not belongs to invalid order' do
      order1 = FactoryGirl.create(:order)
      order2 = FactoryGirl.create(:order)
      invoice = FactoryGirl.create(:invoice ,order_id:order1.id)
      invoice.order_id.should eq order1.id
      invoice.order_id.should_not eq order2.id
    end
  end
end
