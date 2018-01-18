class OrdersController < ApplicationController
  def index
    respond_to do |format|
      @orders = Order.all
      format.json { render json: {orders: @orders}, status: :ok }
      format.html 
    end
  end

  def create
  	respond_to do |format|
      begin 
        @order = Order.new(order_params)
   	    if @order.save 
          format.json { render json: {order: @order}, status: :ok }
       	  format.html { redirect_to @order }
        else
          format.json { render json: {order: @order.errors}, status: :unprocessable_entity }
          format.html { render html: {order: @order.errors}, status: :unprocessable_entity }
        end
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
        format.html { render html: {error: e.message}, status: :unprocessable_entity }
      end
   	end
  end

  def show
  	respond_to do |format|
      begin
      	@order = Order.find(params[:id])
        format.json { render json: {order: @order}, status: :ok }
        format.html 
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
        format.html { render html: {error: e.message}, status: :unprocessable_entity }
      end
    end
  end
  
  def new
    @order = Order.new
  end

  def edit
    respond_to do |format|
      begin
        @order = Order.find(params[:id])
        format.html 
        format.json { render json: {order: @order}, status: :ok }
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
        format.html { render html: {error: e.message} }
      end
    end 
  end

  def update
  	respond_to do |format|
      begin 
        @order = Order.find(params[:id])
        if @order.update(order_params)
          format.json { render json: {order: @order}, status: :ok }
          format.html { redirect_to @order }
        else
          format.json { render json: {order: @order.errors}, status: :unprocessable_entity }
          format.html { render html: {order: @order.errors}, status: :unprocessable_entity }
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
		    @order = Order.find(params[:id])
  	    if @order.destroy
     	    format.json { render json: {mesage: "Deleted!"}, status: :ok }
          format.html { redirect_to orders_path }
        else
          format.json { render json: {order: @order.errors}, status: :unprocessable_entity }
          format.html { render html: {order: @order.errors}, status: :unprocessable_entity }
        end
      rescue => e
        format.json { render json: {message: e.message}, status: :unprocessable_entity }
        format.html { render html: {message: e.message}, status: :unprocessable_entity }
      end
    end
  end
  
  private

  def order_params
    params.require(:order).permit(:dish_name, :dish_price)
  end
end
