require 'rails_helper'

RSpec.describe RestaurantSystem, type: :model do
  context 'validation test' do 
    it 'is valid restaurant_system' do
      FactoryGirl.build(:restaurant_system).should be_valid 
    end

    it 'should validate restaurant_system phone presence nil' do
      FactoryGirl.build(:restaurant_system, phone: nil).should_not be_valid 
    end   

    it 'should validate restaurant_system name presence true' do
      FactoryGirl.build(:restaurant_system, name: nil).should_not be_valid 
    end

    it 'should validate address presence true' do
      FactoryGirl.build(:restaurant_system, address: nil).should_not be_valid 
    end
    
    it 'should validate phone length between 10..15' do
      FactoryGirl.build(:customer, phone: "123456789").should_not be_valid 
    end

    it 'should validate phone length between 10..15' do
      FactoryGirl.build(:customer, phone: "12345678910121415").should_not be_valid 
    end
  end

  context 'assosiation test' do
    it 'should has many customers' do
      restaurant_systemVar = FactoryGirl.create(:restaurant_system)
      customer1 = FactoryGirl.create(:customer, restaurant_system_id:restaurant_systemVar.id)
      customer2 = FactoryGirl.create(:customer, restaurant_system_id:restaurant_systemVar.id)
      customer1.restaurant_system_id.should eq restaurant_systemVar.id
      customer2.restaurant_system_id.should eq restaurant_systemVar.id
    end
    
    it 'should has many invoices' do
      restaurant_systemVar = FactoryGirl.create(:restaurant_system)
      invoice1 = FactoryGirl.create(:invoice, restaurant_system_id:restaurant_systemVar.id)
      invoice2 = FactoryGirl.create(:invoice, restaurant_system_id:restaurant_systemVar.id)
      invoice1.restaurant_system_id.should eq restaurant_systemVar.id
      invoice2.restaurant_system_id.should eq restaurant_systemVar.id
    end

    it 'should not has unincluded customers' do
      restaurant_systemVar1 = FactoryGirl.create(:restaurant_system)
      restaurant_systemVar2 = FactoryGirl.create(:restaurant_system)
      customer1 = FactoryGirl.create(:customer, restaurant_system_id:restaurant_systemVar1.id)
      customer2 = FactoryGirl.create(:customer, restaurant_system_id:restaurant_systemVar2.id)
      customer1.restaurant_system_id.should eq restaurant_systemVar1.id
      customer1.restaurant_system_id.should_not eq restaurant_systemVar2.id
      customer2.restaurant_system_id.should eq restaurant_systemVar2.id
      customer2.restaurant_system_id.should_not eq restaurant_systemVar1.id
    end

    it 'should not has unincluded invoices' do
      restaurant_systemVar1 = FactoryGirl.create(:restaurant_system)
      restaurant_systemVar2 = FactoryGirl.create(:restaurant_system)
      invoice1 = FactoryGirl.create(:invoice, restaurant_system_id:restaurant_systemVar1.id)
      invoice2 = FactoryGirl.create(:invoice, restaurant_system_id:restaurant_systemVar2.id)
      invoice1.restaurant_system_id.should eq restaurant_systemVar1.id
      invoice2.restaurant_system_id.should eq restaurant_systemVar2.id
      invoice1.restaurant_system_id.should_not eq restaurant_systemVar2.id
      invoice2.restaurant_system_id.should_not eq restaurant_systemVar1.id
    end
  end
end
