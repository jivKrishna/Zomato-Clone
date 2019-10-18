class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!, only: :delivered
  before_action :find_restaurant, only: [ :place_order, :delivered ]

  def index
    @placed_orders = current_user.orders.in_progress.paginate(page: params[:page], per_page: 2).order(placed_at: :desc)
    @delivered_orders = current_user.orders.delivered.last(2)

  end

  def show
    @order = Order.find(params[:id])

    if @order.update(status: 2)
      redirect_to restaurant_orders_path, flash: { success: "Your order is successfully delivered!" }
    else
      redirect_back fallback_location: restaurant_orders_path, flash: { danger: "Something went wrong!" }
    end
  end

  def destroy
    @order = Order.find(params[:id])
    if @order.destroy
      redirect_to restaurant_orders_path, flash: { success: "Your order have been canceled successfully!" }
    else
      redirect_back fallback_location: restaurant_orders_path, flash: { danger: "Something went wrong!" }
    end
  end

  def place_order
    if current_order.update(status: 1, placed_at: Time.now)
      session[:order_id] = nil
      redirect_back fallback_location: restaurant_orders_path, flash: { success: "Successfully placed order!" }
    else
      redirect_back fallback_location: restaurant_orders_path, flash: { danger: "Something went wrong!" }
    end
  end

  private
    def find_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

end
