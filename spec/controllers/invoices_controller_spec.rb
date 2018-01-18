require 'rails_helper'

RSpec.describe InvoicesController, type: :controller do
  context 'GET' do
    it 'should get all index successfully' do
  	  get :index, format: 'json'
  	  response.should have_http_status(:ok)
  	end

  	it 'should get invoice successfully' do
  	  invoice= FactoryGirl.create(:invoice)
  	  get :show, id: invoice.id, format: 'json'
  	  response.should have_http_status(:ok)
  	end
    
    it 'should not get invoice successfully for empty ID' do
      invoice= FactoryGirl.create(:invoice)
      get :show, id: '', format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'POST' do
    it 'should post invoice successfully' do
      invoice = FactoryGirl.create(:invoice)
      post :create, invoice: { dish_name:invoice.dish_name, dish_price:invoice.dish_price, total:invoice.total }, format: 'json'
      response.should have_http_status(:ok)
    end

    it 'should not post invoice successfully for empty values' do
      post :create, invoice: { dish_name:'', dish_price:'', total:'' }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end	
  end
  
  context 'PUT' do
  	it 'should update invoice successfully' do
  	  invoice = FactoryGirl.create(:invoice)
      put :update, id: invoice.id, invoice: { dish_name:invoice.dish_name, dish_price:invoice.dish_price, total:invoice.total }, format: 'json'
      response.should have_http_status(:ok)
  	end

  	it 'should not update invoice successfully for empty values' do
  	  invoice = FactoryGirl.create(:invoice)
      put :update, id: invoice.id, invoice: { dish_name:'', dish_price:'', total:'' }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
  	end
  end

  context 'DELETE' do
  	it 'should delete invoice successfully' do
  	  invoice = FactoryGirl.create(:invoice)
      delete :destroy, id: invoice.id, format: 'json'
      response.should have_http_status(:ok)
  	end

    it 'should not delete invoice successfully for empty ID' do
      invoice = FactoryGirl.create(:invoice)
      delete :destroy, id: '', format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
end