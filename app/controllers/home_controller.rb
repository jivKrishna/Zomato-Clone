class HomeController < ApplicationController
  before_action :set_auth

  def index
    @user = User.new
  end

  private
    def set_auth
      @auth = session[:omniauth] if session[:omniauth]
    end
end
