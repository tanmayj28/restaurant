class RestaurantSystemsController < ApplicationController
  def index
    respond_to do |format|
      @restaurant_systems = RestaurantSystem.all
      format.json { render json: {restaurant_systems: @restaurant_systems}, status: :ok }
      format.html 
    end
  end

  def create
  	respond_to do |format|
      begin 
        @restaurant_system = RestaurantSystem.new(restaurant_system_params)
   	    if @restaurant_system.save 
          format.json { render json: {restaurant_system: @restaurant_system}, status: :ok }
       	  format.html { redirect_to @restaurant_system }
        else
          format.json { render json: {restaurant_system: @restaurant_system.errors}, status: :unprocessable_entity }
          format.html { render html: {restaurant_system: @restaurant_system.errors}, status: :unprocessable_entity }
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
      	@restaurant_system = RestaurantSystem.find(params[:id])
        format.json { render json: {restaurant_system: @restaurant_system}, status: :ok }
        format.html 
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
        format.html { render html: {error: e.message}, status: :unprocessable_entity }
      end
    end
  end

  def new
    @restaurant_system = RestaurantSystem.new
  end
  
  def edit
    respond_to do |format|
      begin
        @restaurant_system = RestaurantSystem.find(params[:id])
        format.html 
        format.json { render json: {restaurant_system: @restaurant_system}, status: :ok }
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
        format.html { render html: {error: e.message} }
      end
    end 
  end

  def update
  	respond_to do |format|
      begin 
        @restaurant_system = RestaurantSystem.find(params[:id])
        if @restaurant_system.update(restaurant_system_params)
          format.json { render json: {restaurant_system: @restaurant_system}, status: :ok }
          format.html { redirect_to @restaurant_system }
        else
          format.json { render json: {restaurant_system: @restaurant_system.errors}, status: :unprocessable_entity }
          format.html { render html: {restaurant_system: @restaurant_system.errors}, status: :unprocessable_entity }
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
		    @restaurant_system = RestaurantSystem.find(params[:id])
	  	  if @restaurant_system.destroy
       	  format.json { render json: {mesage: "Deleted!"}, status: :ok }
          format.html { redirect_to restaurant_systems_path }
        else
          format.json { render json: {restaurant_system: @restaurant_system.errors}, status: :unprocessable_entity }
          format.html { render html: {restaurant_system: @restaurant_system.errors}, status: :unprocessable_entity }
        end
      rescue => e
        format.json { render json: {message: e.message}, status: :unprocessable_entity }
        format.html { render html: {message: e.message}, status: :unprocessable_entity }
      end
    end
  end

  private
  
  def restaurant_system_params
    params.require(:restaurant_system).permit(:name, :phone, :address)
  end
end
