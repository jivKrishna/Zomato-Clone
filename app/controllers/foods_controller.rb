class FoodsController < ApplicationController
  before_action :authenticate_admin!, only: [:create ]

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @food_category = FoodCategory.new
    @foods = Food.all
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @food = @restaurant.foods.create(food_params)

    if @food.save
      redirect_to @restaurant, flash: { success: "#{@food.name} is added successfully!" }
    end
  end

  private
    def food_params
      params.require(:food).permit(:name, :image,:description, :price, :veg, :food_category_id)
    end
end
