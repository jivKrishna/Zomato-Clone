class HomeController < ApplicationController
  before_action :set_auth

  def index
    @user = User.new

    #search restaurant using elastic search nearest or given location
    restaurants = Restaurant.search(( params[:q].present? ? params[:q] : "*" ), size: 1000)
                  .records.near(( params[:near].present? ? params[:near] : params[:location] ), 25)
    # @restaurants = Restaurant.
    @restaurant_nearby = restaurants.paginate(page: params[:page], per_page: 6)

    # @restaurant_nearby = Restaurant.search(params[:q], size: 100).records.near("Rishra").order(distance: :asc, name: :asc).paginate(page:params[:page], per_page: 12 )
  end

  private
    def set_auth
      @auth = session[:omniauth] if session[:omniauth]
    end
end
