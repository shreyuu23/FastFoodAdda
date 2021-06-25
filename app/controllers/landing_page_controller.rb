class LandingPageController < ApplicationController
	before_action :authenticate_user!
	def index
		@cities = City.all
		@areas = Area.all
	end

	def  admin;
		@restaurants = Restaurant.all.count
		@orders  = Order.all.count
    end

  def user
  	@cities = City.all
		@areas = Area.all
  end
   

  def resto
  end  
  
  def filter_areas
  end
	
end

