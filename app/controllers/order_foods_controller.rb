class OrderFoodsController < ApplicationController

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @food_item = FoodItem.find(params[:food_item_id])

    @order_food = @food_item.order_foods.build(order_food_params)
    @order_food.user = current_user
    if @order_food.save
      redirect_to restaurant_food_items_path(@restaurant, @food_item)
    end
  end

  private
    def order_food_params
      params.require(:order_food).permit(:quantity)
    end

end