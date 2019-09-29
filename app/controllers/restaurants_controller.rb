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
  end

  private

    def restaurant_params
      params.require(:restaurant).permit(
        :name,
        :restaurant_type,
        :phone_number,
        :secondary_phone_number,
        :email,
        :city,
        :address,
        :open_time,
        :close_time
      )
    end
end
