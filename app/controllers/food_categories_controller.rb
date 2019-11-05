class FoodCategoriesController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_food_category, only: [:edit, :update, :destroy]

  def index
    @food_category = FoodCategory.new
    @food_categories = FoodCategory.paginate(page: params[:page], per_page: 6).all.order(updated_at: :desc)
  end

  def create
    @food_category = FoodCategory.create(food_category_params)

    if @food_category.save
      redirect_to food_categories_path, flash: { success: "A food category created!" }
    else
      redirect_back fallback_location: food_categories_path, flash: { danger: @food_category.errors.full_messages.join("<br>") }
    end
  end

  def update
    if @food_category.update(food_category_params)
      redirect_to food_categories_path, flash: { success: "A food category updated!" }
    else
      redirect_back fallback_location: food_categories_path, flash: { danger: @food_category.errors.full_messages.join("<br>") }
    end
  end

  def destroy
    if @food_category.destroy
      redirect_to food_categories_path, flash: { success: "A food category deleted!" }
    else
      redirect_back fallback_location: food_categories_path, flash: { danger: @food_category.errors.full_messages.join("<br>") }
    end
  end

  private
    def food_category_params
      params.require(:food_category).permit(:name)
    end

    def find_food_category
      @food_category = FoodCategory.find(params[:id])
    end
end
