class HomeController < ApplicationController
  before_action :set_auth

  def index
    @user = User.new

    #search restaurant using elastic search
    @restaurants = Restaurant.search(( params[:q].present? ? params[:q] : "*" )).records

    #search restaurant near by place within 25km circle.
    @restaurant_nearby = Restaurant.near(params[:near], 25).order(distance: :asc, name: :asc) if params[:near].present?
  end

  private
    def set_auth
      @auth = session[:omniauth] if session[:omniauth]
    end
end
