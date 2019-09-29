class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
    def current_user
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def signed_in?
      !!current_user
    end

    def is_admin?
      current_user.admin
    end

    def authenticate_user!
      redirect_to root_path("#loginAccountModal") unless signed_in?
    end

    def authenticate_admin!
      redirect_to admin_registration_path unless is_admin? 
    end

    helper_method :current_user, :signed_in?, :authenticate, :is_admin?
end
