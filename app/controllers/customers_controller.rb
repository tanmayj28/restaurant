class CustomersController < ApplicationController
  def index
    respond_to do |format|
      @customers = Customer.all
      format.json { render json: {customers: @customers}, status: :ok }
      format.html 
    end
  end 
 
  def create
  	respond_to do |format|
      begin 
        @customer = Customer.new(customer_params)
        if @customer.save 
          format.json { render json: {customer: @customer}, status: :ok }
       	  format.html { redirect_to menus_path }
        else
          format.json { render json: {customer: @customer.errors}, status: :unprocessable_entity }
          format.html { render html: {customer: @customer.errors}, status: :unprocessable_entity }
        end
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
        format.html { render 'new' }
      end
   	end
  end

  def show
  	respond_to do |format|
      begin
      	@customer = Customer.find(params[:id])
        format.json { render json: {customer: @customer}, status: :ok }
        format.html 
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
        format.html { render html: {error: e.message}, status: :unprocessable_entity }
      end
    end
  end
  
  def new
    @customer = Customer.new
  end
  
  def edit
    respond_to do |format|
      begin
        @customer = Customer.find(params[:id])
        format.html 
        format.json { render json: {customer: @customer}, status: :ok }
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
        format.html { render html: {error: e.message} }
      end
    end 
  end

  def new
    @customer = Customer.new
  end

  def update
  	respond_to do |format|
      begin 
        @customer = Customer.find(params[:id])
        if @customer.update(customer_params)
          format.json { render json: {customer: @customer}, status: :ok }
          format.html { redirect_to @customer }
        else
          format.json { render json: {customer: @customer.errors}, status: :unprocessable_entity }
          format.html { render html: {customer: @customer.errors}, status: :unprocessable_entity }
        end
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
        format.html { render html: {error: e.message}, status: :unprocessable_entity }
      end
  	end
  end

  def destroy
  	respond_to do |format|
  	  begin 
    		@customer = Customer.find(params[:id])
  	  	if @customer.destroy
         	  format.json { render json: {mesage: "Deleted!"}, status: :ok }
            format.html { redirect_to customers_path }
        else
          format.json { render json: {customer: @customer.errors}, status: :unprocessable_entity }
          format.html { render html: {customer: @customer.errors}, status: :unprocessable_entity }
        end
      rescue => e
        format.json { render json: {message: e.message}, status: :unprocessable_entity }
        format.html { render html: {message: e.message}, status: :unprocessable_entity }
      end
    end
  end

  private
  
  def customer_params
    params.require(:customer).permit(:name, :phone, :address, :no_of_people)
  end
end
