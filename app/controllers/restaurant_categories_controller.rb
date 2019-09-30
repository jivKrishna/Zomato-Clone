class RestaurantCategoriesController < ApplicationController
  def new
    @restaurant_category = RestaurantCategory.new
  end

  def create
    @restaurant_category = RestaurantCategory.create(restaurant_category_params)

    if @restaurant_category.save
      redirect_to profile_path(@current_user), flash: { success: "A restaurant category is added!" }
    else
      render :new, flash: { danger: "This restaurant category is already available!" }
    end
  end

  private

    def restaurant_category_params
      params.require(:restaurant_category).permit(:name)
    end
end
