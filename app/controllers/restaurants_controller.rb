class RestaurantsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create]
  before_action :find_restaurant, only: [ :show ]

  def index
    # @restaurant = Restaurant.all.order(rating: )
  end

  def show
    #approved reviews and current user review that not approved yet...
    @reviews = @restaurant.reviews.where(approve: "approved" ).or(
                @restaurant.reviews.where(user_id: current_user.id)
              ).order(created_at: :desc)

    #reviews that not approved yet.. only admin can see that...
    @reviews_not_approved = @restaurant.reviews.where(approve: 0 ).order(created_at: :desc)

    #average rating of restaurant based on approved reviews...
    @avg_rating = @restaurant.reviews.where(approve: 1).average(:rating)

    #for creating new instance of review...
    @review = @restaurant.reviews.build
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)

    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

    def restaurant_params
      params.require(:restaurant).permit( :name, :image, :restaurant_category_id, :phone_number,
        :secondary_phone_number, :email, :city, :address, :serve_alcohal, :owner_email,
        :owner_phone_number
      )
    end

    def find_restaurant
      @restaurant = Restaurant.find(params[:id])
    end
end