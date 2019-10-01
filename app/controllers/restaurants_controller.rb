class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: :show
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
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

    def restaurant_params
      params.require(:restaurant).permit( :name, :image, :restaurant_category_id, :phone_number,
        :secondary_phone_number, :email, :city, :address, :serve_alcohal, :owner_email,
        :owner_phone_number
      )
    end

    def find_restaurant
      @restaurant = Restaurant.find(params[:id])
    end
end