class MenusController < ApplicationController
  def index
    respond_to do |format|
      @menus = Menu.all
      format.json { render json: {menus: @menus}, status: :ok }
      format.html 
    end
  end 

  def create 
  	respond_to do |format|
      begin 
        @menu = Menu.new(menu_params)
        if @menu.save 
          format.json { render json: {menu: @menu}, status: :ok }
       	  format.html { redirect_to @menu }
        else
          format.json { render json: {menu: @menu.errors}, status: :unprocessable_entity }
          format.html { render html: {menu: @menu.errors}, status: :unprocessable_entity }
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
      	@menu = Menu.find(params[:id])
        format.json { render json: {menu: @menu}, status: :ok }
        format.html 
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
        format.html { render html: {error: e.message}, status: :unprocessable_entity }
      end
    end
  end

  def new
    @menu = Menu.new
  end

  def edit
    respond_to do |format|
      begin
        @menu = Menu.find(params[:id])
        format.html 
        format.json { render json: {menu: @menu}, status: :ok }
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
        format.html { render html: {error: e.message} }
      end
    end 
  end

  def update
  	respond_to do |format|
      begin 
        @menu = Menu.find(params[:id])
        if @menu.update(menu_params)
          format.json { render json: {menu: @menu}, status: :ok }
          format.html { redirect_to @menu }
        else
          format.json { render json: {menu: @menu.errors}, status: :unprocessable_entity }
          format.html { render html: {menu: @menu.errors}, status: :unprocessable_entity }
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
		    @menu = Menu.find(params[:id])
	  	  if @menu.destroy
       	  format.json { render json: {mesage: "Deleted!"}, status: :ok }
          format.html { redirect_to menus_path }
        else
          format.json { render json: {menu: @menu.errors}, status: :unprocessable_entity }
          format.html { render html: {menu: @menu.errors}, status: :unprocessable_entity }
        end
      rescue => e
        format.json { render json: {message: e.message}, status: :unprocessable_entity }
        format.html { render html: {message: e.message}, status: :unprocessable_entity }
      end
    end
  end

  private
  
  def menu_params
    params.require(:menu).permit(:dish_name, :dish_description, :dish_price)
  end
end
