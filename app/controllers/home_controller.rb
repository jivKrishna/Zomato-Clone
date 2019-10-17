class HomeController < ApplicationController
  before_action :set_auth

  def index
    @user = User.new
    @cities = Restaurant.distinct.pluck([:city])

    #search restaurant using elastic search
    @restaurants = Restaurant.search(( params[:q].present? ? params[:q] : "*" )).records

    #search restaurant nearby place
    @restaurant_nearby = Restaurant.near(params[:city]) if params[:city].present?
  end

  private
    def set_auth
      @auth = session[:omniauth] if session[:omniauth]
    end
end
