class HomeController < ApplicationController
  before_action :set_auth

  def index
    @user = User.new

    #search restaurant using elastic search nearest or given location
    @restaurant_nearby = Restaurant.search(( params[:q].present? ? params[:q] : "*" ), size: 1000)
                  .records.near(( params[:near].present? ? params[:near] : params[:location] ), 25)
                    .order(distance: :asc).paginate(page: params[:page], per_page: 6)

    #restaurants in kolkata
    @kolkata_restaurants = Restaurant.near("Kolkata").order(distance: :asc).paginate(page: params[:page], per_page: 6)    
  end

  private
    def set_auth
      @auth = session[:omniauth] if session[:omniauth]
    end
end
