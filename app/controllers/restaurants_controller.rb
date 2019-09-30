class RestaurantsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)

    if @restaurant.save
      redirect_to profile_path(@current_user)
    else
      render :new
    end
  end

  private

    def restaurant_params
      params.require(:restaurant).permit( :name, :restaurant_category_id, :phone_number, :secondary_phone_number, :email, :city, :address )
    end
end