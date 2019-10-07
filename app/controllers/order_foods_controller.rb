class OrderFoodsController < ApplicationController
  before_action :find_order_food, only: [:update, :destroy]
  def create
    @restaurant = Restaurant.find( params[:restaurant_id] )
    @food_item = @restaurant.food_items.find( params[:food_item_id] )
    if @food_item.order_foods.present?
      @order_food = @food_item.order_foods.first
      qnt = @order_food.quantity + params[:order_food][:quantity].to_i

      if @order_food.update(quantity: qnt)
        redirect_to restaurant_food_items_path( @order_food.food_item.restaurant, @order_food.food_item )
      end
    else
      @order_food = @food_item.order_foods.create( order_food_params )
      if @order_food.save!
        redirect_to restaurant_food_items_path( @food_item.restaurant, @food_item )
      end
    end
  end

  def update
    if @order_food.update(order_food_params)
      redirect_to restaurant_food_items_path( @order_food.food_item.restaurant, @order_food.food_item )
    end
  end

  def destroy
    if @order_food.destroy
      redirect_to restaurant_food_items_path( @order_food.food_item.restaurant, @order_food.food_item )
    end
  end
  
  private
    def order_food_params
      params.require(:order_food).permit(:quantity, :user_id)
    end

    def find_order_food
      @order_food = OrderFood.find(params[:id])
    end

end