class FoodsController < ApplicationController
  before_action :authenticate_admin!, only: [:create ]
  before_action :find_restaurant, only: [:create, :index]

  def index
    @food_category = FoodCategory.new
    @foods = Food.all
  end

  def create
    @food = @restaurant.foods.create(food_params)

    if @food.save
      redirect_to restaurant_foods_path(@restaurant), flash: { success: "#{@food.name} is added successfully!" }
    end
  end

  private
    def food_params
      params.require(:food).permit(:name, :image, :price, :veg, :food_category_id)
    end

    def find_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end
end
