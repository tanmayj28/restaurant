require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'validation test' do 
    it 'is valid order' do
      FactoryGirl.build(:order).should be_valid 
    end

    it 'should validate order dish price presence nil' do
      FactoryGirl.build(:order, dish_price: nil).should_not be_valid 
    end   

    it 'should validate order dish name presence true' do
      FactoryGirl.build(:order, dish_name: nil).should_not be_valid 
    end

    it 'should validate dish_price numericality more than 0' do
      FactoryGirl.build(:order, dish_price: -1234).should_not be_valid 
    end
    
    it 'should validate dish_price numericality less than 100000' do
      FactoryGirl.build(:order, dish_price: 989898989898).should_not be_valid 
    end   
  end

  context 'assosiation test' do
    it 'should belongs to menu' do
      menu = FactoryGirl.create(:menu)
      order = FactoryGirl.create(:order ,menu_id:menu.id)
      order.menu_id.should eq menu.id
    end

    it 'should belongs to customer' do
      customer = FactoryGirl.create(:customer)
      order = FactoryGirl.create(:order ,customer_id:customer.id)
      order.customer_id.should eq customer.id
    end

    it 'should not belongs to invalid menu' do
      menu1 = FactoryGirl.create(:menu)
      menu2 = FactoryGirl.create(:menu)
      order = FactoryGirl.create(:order ,menu_id:menu1.id)
      order.menu_id.should eq menu1.id
      order.menu_id.should_not eq menu2.id
    end

    it 'should not belongs to invalid customer' do
      customer1 = FactoryGirl.create(:customer)
      customer2 = FactoryGirl.create(:customer)
      order = FactoryGirl.create(:order ,customer_id:customer1.id)
      order.customer_id.should eq customer1.id
      order.customer_id.should_not eq customer2.id
    end
  end

  context 'assosiation test' do
    it 'should has many invoices' do
      orderVar = FactoryGirl.create(:order)
      invoice1 = FactoryGirl.create(:invoice, order_id:orderVar.id)
      invoice2 = FactoryGirl.create(:invoice, order_id:orderVar.id)
      invoice1.order_id.should eq orderVar.id 
      invoice2.order_id.should eq orderVar.id
    end

    it 'should not has unincluded invoices' do
      orderVar1 = FactoryGirl.create(:order)
      orderVar2 = FactoryGirl.create(:order)
      invoice1 = FactoryGirl.create(:invoice, order_id:orderVar1.id)
      invoice2 = FactoryGirl.create(:invoice, order_id:orderVar2.id)
      invoice1.order_id.should eq orderVar1.id
      invoice1.order_id.should_not eq orderVar2.id 
      invoice2.order_id.should eq orderVar2.id
      invoice2.order_id.should_not eq orderVar1.id
    end
  end
end
