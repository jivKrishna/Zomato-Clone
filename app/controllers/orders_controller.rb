class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!, only: :delivered
  before_action :find_restaurant, only: [ :place_order, :delivered ]

  def index
    @placed_orders = current_user.orders.in_progress.order(placed_at: :desc)
  end

  def destroy
    @order = Order.find(params[:id])
    if @order.destroy
      redirect_to restaurant_orders_path
    end
  end

  def place_order
    if current_order.update(status: 1, placed_at: Time.now)
      session[:order_id] = nil
      redirect_to restaurant_orders_path
    end
  end

  # def delivered
  #   @order = Order.find(params[:id])

  #   if @order.update(status: 2)
  #     redirect_to restaurant_orders_path
  #   end
  # end

  private
    def find_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

end
