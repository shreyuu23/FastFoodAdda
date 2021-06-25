class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.where(restaurant_id: current_user.restaurant.id)
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end
  
  def restaurant_items
    restaurant = Restaurant.where(id: params[:id])
    @items = restaurant.last.items if restaurant.present?
  end

  # GET /items/new
  def new
    # @restaurants_obj = Restaurant.all.pluck("name", "id")
    if current_user.role_id ==3 || current_user.role_id ==1
    @item= Item.new
    @items = Item.where(restaurant_name: current_user.restaurant.name)
  end
end

  # GET /items/1/edit
  def edit
      
  end

  # POST /items
  # POST /items.json
  def create
     @item = Item.new(item_params)
    # @item.restaurant_id = Restaurant.where(:email current_user.email)
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :description, :image, :restaurant_id, :price)
    end
end
