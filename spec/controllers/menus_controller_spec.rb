require 'rails_helper'

RSpec.describe MenusController, type: :controller do
  context 'GET' do
    it 'should GET all index successfully' do
  	  get :index, format: 'json'
  	  response.should have_http_status(:ok)
  	end

  	it 'should get menu successfully' do
  	  menu= FactoryGirl.create(:menu)
  	  get :show, id: menu.id, format: 'json'
  	  response.should have_http_status(:ok)
  	end

    it 'should not get menu successfully' do
      menu= FactoryGirl.create(:menu)
      get :show, id: '', format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'POST' do 
    it 'should POST menu successfully' do
      menu = FactoryGirl.create(:menu)
      restaurant_system = FactoryGirl.create(:restaurant_system)
      customer = FactoryGirl.create(:customer, restaurant_system_id:restaurant_system.id)
      post :create, menu: { dish_name:menu.dish_name, dish_description:menu.dish_description, dish_price:menu.dish_price, customer_id: customer.id }, format: 'json'
      response.should have_http_status(:ok)
    end

    it 'should not post menu successfully for empty data' do
      post :create, menu: { dish_name:'', dish_description:'', dish_price:'' }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end	
  end
  
  context 'PUT' do
  	it 'should update menu successfully' do
  	  menu = FactoryGirl.create(:menu)
      put :update, id: menu.id, menu: { dish_name:menu.dish_name, dish_description:menu.dish_description, dish_price:menu.dish_price }, format: 'json'
      response.should have_http_status(:ok)
  	end

  	it 'should not udpate menu successfully for empty values' do
  	  menu = FactoryGirl.create(:menu)
      put :update, id: menu.id, menu: { dish_name:'', dish_description:'', dish_price:'' }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
  	end
  end

  context 'DELETE' do
  	it 'should delete menu successfully' do
  	  menu = FactoryGirl.create(:menu)
      delete :destroy, id: menu.id, format: 'json'
      response.should have_http_status(:ok)
  	end

    it 'should not delete menu successfully for empty ID' do
      menu = FactoryGirl.create(:menu)
      delete :destroy, id: '', format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
end
