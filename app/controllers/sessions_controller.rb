class SessionsController < ApplicationController
  before_action :authenticate_user!, only: :destroy
  def new
  end

  def create_from_socialmedia
    auth = request.env["omniauth.auth"]
    session[:omniauth] = auth.except("extra")
    user = User.find_by(provider: auth["provider"], uid: auth["uid"])

    if user.nil?
      user = User.create(
        name: auth["info"]["name"],
        email: auth["info"]["email"],
        image: URI.parse(auth["info"]["image"]).open,
        provider: auth["provider"],
        uid: auth["uid"]
      )
    end
    
    session[:user_id] = user.id
    redirect_to root_url, notice: "Signed In!"
  end


  def create
    user = User.find_by(email: params[:session][:email], provider: "email")
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path
    end
  end

  def destroy 
    session.clear
    redirect_to root_url, notice: "Signed Out!"
  end

end
