class OrderItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_food_item, only: [ :create, :update, :destroy ]
  before_action :find_order_item, only: [:update, :destroy]

  def create
    @order_item = current_order.order_items.create(order_item_params)
    @order_item.food_item_id = @food_item.id

    if @order_item.save
      current_order.save
      redirect_to restaurant_food_items_path( @food_item.restaurant, @food_item )
    end  
  end

  def update
    if @order_item.update(quantity: params[:order_item][:quantity])
      current_order.save
      redirect_to restaurant_food_items_path( @food_item.restaurant, @food_item )
    end
  end

  def destroy
    if @order_item.destroy
      current_order.save
      redirect_to restaurant_food_items_path( @food_item.restaurant, @food_item )
    end
  end

  private
    def order_item_params
      params.require(:order_item).permit(:quantity)
    end

    def find_food_item
      @food_item = FoodItem.find(params[:food_item_id])
    end

    def find_order_item
      @order_item = OrderItem.find(params[:id])
    end
end
