class RestaurantsController < ApplicationController
  before_action :authenticate_admin!, except: [ :show, :index ]
  before_action :find_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :restaurant_category_options, only: [:new, :edit]

  def index
    @restaurants = Restaurant.paginate(page: params[:page], per_page: 6).order(created_at: :desc)
  end

  def show
    #approved reviews or current_user not approved reviews.
    @reviews_approved = @restaurant.reviews.approved.or( @restaurant.reviews.not_approved
    .where(user_id: current_user.id) ).paginate(page: params[:page], per_page: 3).order(created_at: :desc) if current_user.present?

    #reviews that not approved yet.. only admin can see that...
    @reviews_not_approved = @restaurant.reviews.not_approved.paginate(page: params[:page], per_page: 3).order(created_at: :desc)

    #average rating of restaurant based on approved reviews...
    @avg_rating = @restaurant.reviews.approved.average(:rating)

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

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  def destroy
    if @restaurant.destroy
      redorect_to restaurants_path
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

    def restaurant_category_options  
      @restaurant_category_options = [["select", nil]] + RestaurantCategory.order(:name).pluck(:name, :id)
    end
end