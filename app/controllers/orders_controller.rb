class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :update_status, :cancel_order, :show_partial]

  def index
      if current_user.role_id ==1
        @orders = Order.all
      else
        @orders = current_user&.restaurant&.orders
      end
      end

  def cancel_order
    #binding.pry
    @order.destroy
     respond_to do |format|
       format.html { redirect_to root_url, notice: 'Order was successfully cancelled.' }
       format.json { head :no_content }
     end
  end

  
  def show
    @order = Order.find(params[:id]) 
  end
  

  def update_status
    #binding.pry
    @order = Order.find(params[:id])
    @order.status = params[:status]
    @order.save
    redirect_to orders_path
  end

   def show_partial
    @order = Order.find(params[:id])
    return render @order
  end
 
  def new
    
    @id = params[:id]
    @item = Item.find(@id)
    @order = Order.new
  end

  
  def edit
  end

  def create
    
    @order = Order.new
    @order.item_id = params[:order][:item_id]
    @order.name = params[:order][:name]
    @order.address = params[:order][:address]
    @order.email = params[:order][:email]
    @order.mobile = params[:order][:mobile]
    @order.quantity = params[:order][:quantity]
    @order.restaurant_id = params[:order][:restaurant_id]
    @order.user_id = current_user.id
    @order.total_price = params[:order][:quantity].to_i * params[:order][:up].to_i
     # respond_to do |format|
     # binding.pry
      if @order.save
        OrderMailer.new_order(@order).deliver_now
      redirect_to order_path(:id => @order.id)
    else
      redirect_to orders_path
    end
  end

       
  #       format.html { redirect_to @order, notice: 'Order was successfully created.' }
  #       format.json { render :show, status: :created, location: @order }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @order.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
    

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

   def destroy
     @order.destroy
     respond_to do |format|
       format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
       format.json { head :no_content }
     end
   end

  private
  
    def set_order
      @order = Order.find(params[:id])
    end

   
     def order_params
       params.require(:order).permit(:name, :address, :email, :mobile, :quantity, :total_price, :item_id, :restaurant_id, :status)
     end
end
