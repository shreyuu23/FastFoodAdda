class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

 
  def index    
    if params[:restaurant].present?
     @restaurants = Restaurant.where(area_id: params[:restaurant][:areas])
   else
    @restaurants = Restaurant.all
   end

  end

  def show
  end

  def new
    # @areas_obj = Area.all.pluck("name", "id")
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  def create
     password = (0...8).map { ('a'..'z').to_a[rand(26)] }.join

  user = User.new(email: params[:email], password: password, password_confirmation: password, role_id: 3)
  if user.save
     
     restaurant = user.build_restaurant(restaurant_params)
    # respond_to do |format|
      if restaurant.save
       
        RestaurantMailer.owner_greeting(params[:email], password).deliver_now
          redirect_to admin_path
          # format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
          # format.json { render :show, status: :created, location: @restaurant }
       else
         redirect_to restaurants_path
       
    end
    end
  
  end
  

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
  
      params.require(:restaurant).permit(:name, :description, :image, :area_id, :user_id)
    end
  

end
