class InvoicesController < ApplicationController
  def index
    respond_to do |format|
      @invoices = Invoice.all
      format.json { render json: {invoices: @invoices}, status: :ok }
      format.html 
    end
  end

  def create
  	respond_to do |format|
      begin 
        @invoice = Invoice.new(invoice_params)
   	    if @invoice.save 
          format.json { render json: {invoice: @invoice}, status: :ok }
       	  format.html { redirect_to @invoice }
        else
          format.json { render json: {invoice: @invoice.errors}, status: :unprocessable_entity }
          format.html { render html: {invoice: @invoice.errors}, status: :unprocessable_entity }
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
      	@invoice = Invoice.find(params[:id])
        format.json { render json: {invoice: @invoice}, status: :ok }
        format.html 
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
        format.html { render html: {error: e.message}, status: :unprocessable_entity }
      end
    end
  end

  def new
    @invoice = Invoice.new
  end

  def edit
    respond_to do |format|
      begin
        @invoice = Invoice.find(params[:id])
        format.html 
        format.json { render json: {invoice: @invoice}, status: :ok }
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
        format.html { render html: {error: e.message} }
      end
    end 
  end

  def update
  	respond_to do |format|
      begin 
        @invoice = Invoice.find(params[:id])
        if @invoice.update(invoice_params)
          format.json { render json: {invoice: @invoice}, status: :ok }
          format.html { redirect_to @invoice }
        else
          format.json { render json: {invoice: @invoice.errors}, status: :unprocessable_entity }
          format.html { render html: {invoice: @invoice.errors}, status: :unprocessable_entity }
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
		    @invoice = Invoice.find(params[:id])
	  	  if @invoice.destroy
       	  format.json { render json: {mesage: "Deleted!"}, status: :ok }
          format.html { redirect_to invoices_path }
        else
          format.json { render json: {invoice: @invoice.errors}, status: :unprocessable_entity }
          format.html { render html: {invoice: @invoice.errors}, status: :unprocessable_entity }
        end
      rescue => e
        format.json { render json: {message: e.message}, status: :unprocessable_entity }
        format.html { render html: {message: e.message}, status: :unprocessable_entity }
      end
    end
  end

  private
  
  def invoice_params
    params.require(:invoice).permit(:dish_name, :dish_price, :total, :order_id)
  end
end
