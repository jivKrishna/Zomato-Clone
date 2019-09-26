class SessionsController < ApplicationController

  def create
    auth = request.env["omniauth.auth"]

    p auth

    session[:omniauth] = auth.except("extra")
    user = User.find_by(provider: auth["provider"], uid: auth["uid"])
    unless user
      user = User.create(
        name: auth["info"]["name"],
        email: auth["info"]["email"],
        image: auth["info"]["image"],
        provider: auth["provider"],
        uid: auth["uid"]
      )
    end
    session[:user_id] = user.id
    redirect_to root_url, notice: "Signed In!"
  end

  def destroy 
    session[:user_id] = nil
    session[:omniauth] = nil
    redirect_to root_url, notice: "Signed Out!"
  end

end
