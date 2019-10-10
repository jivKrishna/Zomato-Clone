class FoodItemsController < ApplicationController
  before_action :authenticate_admin!, only: [:create ]
  before_action :find_restaurant, only: [:create, :index]
  before_action :find_food_item, only: [ :show, :edit, :update, :destroy ]

  def index
    @food_categories = FoodCategory.includes(:food_items).all
    @food_items = @restaurant.food_items.all

    @order_items = current_order.order_items.includes(food_item: :restaurant)
  end

  def show
  end

  def create
    @food_item = @restaurant.food_items.create(food_item_params)

    if @food_item.save
      redirect_to restaurant_food_items_path(@restaurant), flash: { success: "#{@food_item.name} is added successfully!" }
    end
  end

  def edit
  end

  def update
    if @food_item.update(food_item_params)
      redirect_to restaurant_food_item_path(@food_item)
    end
  end

  def destroy
    if @food_item.destroy
      redirect_to restaurant_food_items_path
    end
  end

  private
    def food_item_params
      params.require(:food_item).permit(:name, :image, :price, :veg, :food_category_id)
    end

    def find_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def find_food_item
      @food_item = FoodItem.find(params[:id])
    end
end
