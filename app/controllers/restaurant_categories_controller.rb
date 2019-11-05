class RestaurantCategoriesController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_restaurant_category, only: [:edit, :update, :destroy]

  def index
    @restaurant_category = RestaurantCategory.new
    @restaurant_categories = RestaurantCategory.paginate(page: params[:page], per_page: 6).all.order(updated_at: :desc)
  end

  def create
    @restaurant_category = RestaurantCategory.create(restaurant_category_params)

    if @restaurant_category.save
      redirect_to restaurant_categories_path, flash: { success: "A restaurant category created!" }
    else
      redirect_back fallback_location: restaurant_categories_path, flash: { danger: validation_errors }
    end
  end

  def update
    if @restaurant_category.update(restaurant_category_params)
      redirect_to restaurant_categories_path, flash: { success: "A restaurant category updated!" }
    else
      redirect_back fallback_location: restaurant_categories_path, flash: { danger: validation_errors }
    end
  end

  def destroy
    if @restaurant_category.destroy
      redirect_to restaurant_categories_path, flash: { success: "A restaurant category deleted!" }
    else
      redirect_back fallback_location: restaurant_categories_path, flash: { danger: validation_errors }
    end
  end

  private
    def restaurant_category_params
      params.require(:restaurant_category).permit(:name)
    end

    def find_restaurant_category
      @restaurant_category = RestaurantCategory.find(params[:id])
    end

    def validation_errors
      @restaurant_category.errors.full_messages.join("<br>")
    end
end
