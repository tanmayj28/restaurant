require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  context 'GET' do
    it 'should get all index successfully' do
  	  get :index, format: 'json'
  	  response.should have_http_status(:ok)
  	end

  	it 'should get order successfully' do
  	  order= FactoryGirl.create(:order)
  	  get :show, id: order.id, format: 'json'
  	  response.should have_http_status(:ok)
  	end

    it 'should not get order successfully for empty id' do
      order= FactoryGirl.create(:order)
      get :show, id: '', format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'POST' do
    it 'should post order successfully' do
      order = FactoryGirl.create(:order)
      post :create, order: { dish_name:order.dish_name, dish_price:order.dish_price }, format: 'json'
      response.should have_http_status(:ok)
    end

    it 'should not post order successfully for empty data' do
      post :create, order: { dish_name:'', dish_price:'' }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end	
  end
  
  context 'PUT' do
  	it 'should update order successfully' do
  	  order = FactoryGirl.create(:order)
      put :update, id: order.id, order: { dish_name:order.dish_name, dish_price:order.dish_price }, format: 'json'
      response.should have_http_status(:ok)
  	end

  	it 'should not update order successfully for empty data' do
  	  order = FactoryGirl.create(:order)
      put :update, id: order.id, order: { dish_name:'', dish_price:'' }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
  	end
  end

  context 'DELETE' do
  	it 'should delete order successfully' do
  	  order = FactoryGirl.create(:order)
      delete :destroy, id: order.id, format: 'json'
      response.should have_http_status(:ok)
  	end

    it 'should not delete order successfully for empty ID' do
      order = FactoryGirl.create(:order)
      delete :destroy, id: '', format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
end