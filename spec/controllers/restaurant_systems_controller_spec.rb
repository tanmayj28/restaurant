require 'rails_helper'

RSpec.describe RestaurantSystemsController, type: :controller do
  context 'GET' do
    it 'should get all index successfully' do
  	  get :index, format: 'json'
  	  response.should have_http_status(:ok)
  	end

  	it 'should get restaurant_system successfully' do
  	  restaurant_system= FactoryGirl.create(:restaurant_system)
  	  get :show, id: restaurant_system.id, format: 'json'
  	  response.should have_http_status(:ok)
  	end

    it 'should not get restaurant_system successfully for empty ID' do
      restaurant_system= FactoryGirl.create(:restaurant_system)
      get :show, id: '', format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'POST' do
    it 'should post restaurant_system successfully' do
      restaurant_system = FactoryGirl.create(:restaurant_system)
      post :create, restaurant_system: { name:restaurant_system.name, phone:restaurant_system.phone, address:restaurant_system.address }, format: 'json'
      response.should have_http_status(:ok)
    end

    it 'should not post restaurant_system successfully for empty values' do
      post :create, restaurant_system: { name:'', phone:'', address:'' }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end	
  end
  
  context 'PUT' do
  	it 'should update restaurant_system successfully' do
  	  restaurant_system = FactoryGirl.create(:restaurant_system)
      put :update, id: restaurant_system.id, restaurant_system: { name:restaurant_system.name, address:restaurant_system.address, phone:restaurant_system.phone }, format: 'json'
      response.should have_http_status(:ok)
  	end

  	it 'should not update restaurant_system successfully for empty data' do
  	  restaurant_system = FactoryGirl.create(:restaurant_system)
      put :update, id: restaurant_system.id, restaurant_system: { name:'', address:'', phone:'' }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
  	end
  end

  context 'DELETE' do
  	it 'should delete restaurant_system successfully' do
  	  restaurant_system = FactoryGirl.create(:restaurant_system)
      delete :destroy, id: restaurant_system.id, format: 'json'
      response.should have_http_status(:ok)
  	end

    it 'should not  delete restaurant_system successfully for empty ID' do
      restaurant_system = FactoryGirl.create(:restaurant_system)
      delete :destroy, id: '', format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
end
