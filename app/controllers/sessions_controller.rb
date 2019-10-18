class SessionsController < ApplicationController
  before_action :authenticate_user!, only: :destroy

  def create_from_socialmedia
    auth = request.env["omniauth.auth"]

        p auth

    session[:omniauth] = auth.except("extra")
    @user = User.find_by(provider: auth["provider"], uid: auth["uid"])

    if @user.nil?
      @user = User.create(
        name: auth["info"]["name"],
        email: auth["info"]["email"],
        provider: auth["provider"],
        image: URI.parse(auth["info"]["image"]).open,
        uid: auth["uid"],
        password: auth["uid"],
        password_confirmation: auth["uid"]
      )
    end
    
    session[:user_id] = @user.id
    redirect_back fallback_location: root_url, flash: { success: "Signed In successfully!" }
  end


  def create
    user = User.find_by(email: params[:session][:email], provider: "email")
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id

      if is_admin?
        redirect_to user_path(current_user), flash: { success: "Signed In as Admin!" }
      else
        redirect_back fallback_location: root_path, flash: { success: "Signed In successfully!" }
      end
    else
      redirect_back fallback_location: root_path, flash: { warning: "Invalid email/password" }
    end
  end

  def destroy 
    session.clear
    redirect_to root_url, flash: { success: "Signed Out successfully!" }
  end

end
