class FoodsController < ApplicationController

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @food = @restaurant.foods.create(food_params)

    if @food.save
      redirect_to @restaurant, flash: { success: "#{@food.name} is added successfully!" }
    else
      render "restaurants/show"
    end
  end

  def food_params
    params.require(:food).permit(:name, :image,:description, :price, :veg)
  end
end
