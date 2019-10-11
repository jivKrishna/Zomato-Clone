class ReviewsController < ApplicationController
  before_action :authenticate_admin!, only: :approve_review
  before_action :authenticate_user!, except: :show
  before_action :find_restaurant, only: [:create, :edit, :update, :destroy, :approve_review]
  before_action :find_review, only: [:edit, :update, :destroy, :approve_review]

  def new
  end

  def create
    @review = @restaurant.reviews.build(review_params)
    @review.user_id = current_user.id

    if @review.save
      redirect_to @restaurant
    end
  end

  def edit 
  end

  def update
    if @review.update(review_params)
      redirect_to @restaurant
    else
      render :edit
    end
  end

  def destroy
    if @review.destroy
      redirect_to @restaurant
    end
  end

  def approve_review
    if @review.update(approve: "approved")
      redirect_to @restaurant
    end
  end

  private
    def find_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def find_review
      @review = @restaurant.reviews.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:rating, :comment, :image)
    end
end
