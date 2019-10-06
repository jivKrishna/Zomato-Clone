class FoodItemsController < ApplicationController
  before_action :authenticate_admin!, only: [:create ]
  before_action :find_restaurant, only: [:create, :index]

  def index
    @food_category = FoodCategory.new
    @food_items = FoodItem.all
  end

  def create
    @food_item = @restaurant.food_items.create(food_item_params)

    if @food_item.save
      redirect_to restaurant_food_items_path(@restaurant), flash: { success: "#{@food_item.name} is added successfully!" }
    end
  end

  private
    def food_item_params
      params.require(:food_item).permit(:name, :image, :price, :veg, :food_category_id)
    end

    def find_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end
end
