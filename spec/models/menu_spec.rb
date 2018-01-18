require 'rails_helper'

RSpec.describe Menu, type: :model do
  context 'validation test' do 
    it 'is valid menu' do
      FactoryGirl.build(:menu).should be_valid 
    end

    it 'should validate menu dish name presence nil' do
      FactoryGirl.build(:menu, dish_name: nil).should_not be_valid 
    end   

    it 'should validate menu dish price presence true' do
      FactoryGirl.build(:menu, dish_price: nil).should_not be_valid 
    end

    it 'should validate dish description presence true' do
      FactoryGirl.build(:menu, dish_description: nil).should_not be_valid 
    end
    
    it 'should validate dish_price numericality more than 0' do
      FactoryGirl.build(:menu, dish_price: -1234).should_not be_valid 
    end
    
    it 'should validate dish_price numericality less than 100000' do
      FactoryGirl.build(:menu, dish_price: 989898989898).should_not be_valid 
    end   
  end

  context 'assosiation test' do
    it 'should belongs to restaurant_system' do
      restaurant_system = FactoryGirl.create(:restaurant_system)
      menu = FactoryGirl.create(:menu ,restaurant_system_id:restaurant_system.id)
      menu.restaurant_system_id.should eq restaurant_system.id
    end

    it 'should not belongs to invalid restaurant_system' do
      restaurant_system1 = FactoryGirl.create(:restaurant_system)
      restaurant_system2 = FactoryGirl.create(:restaurant_system)
      menu = FactoryGirl.create(:menu ,restaurant_system_id:restaurant_system1.id)
      menu.restaurant_system_id.should eq restaurant_system1.id
      menu.restaurant_system_id.should_not eq restaurant_system2.id
    end
  end

  context 'assosiation test' do
    it 'should has many orders' do
      menuVar = FactoryGirl.create(:menu)
      order1 = FactoryGirl.create(:order, menu_id:menuVar.id)
      order2 = FactoryGirl.create(:order, menu_id:menuVar.id)
      order1.menu_id.should eq menuVar.id 
      order2.menu_id.should eq menuVar.id
    end

    it 'should not has unincluded orders' do
      menuVar1 = FactoryGirl.create(:menu)
      menuVar2 = FactoryGirl.create(:menu)
      order1 = FactoryGirl.create(:order, menu_id:menuVar1.id)
      order2 = FactoryGirl.create(:order, menu_id:menuVar2.id)
      order1.menu_id.should eq menuVar1.id
      order1.menu_id.should_not eq menuVar2.id 
      order2.menu_id.should eq menuVar2.id
      order2.menu_id.should_not eq menuVar1.id
    end
  end
end
