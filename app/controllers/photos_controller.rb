class PhotosController < ApplicationController
  before_action :find_restaurant, only: :index
  
  def index
    @food_items = @restaurant.food_items.all
    @reviews = @restaurant.reviews.approved.all
  end

  private 
    def find_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end
end
