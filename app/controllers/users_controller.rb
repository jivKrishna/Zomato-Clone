class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :admin_registration]
  before_action :find_user, only: :create

  def index
  end

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    if @user
      @user.errors[:base] << "User already available!"
      render root_path
    else
      @user = User.new(user_params)
      @user.image = "default_img.png" unless @user.image.present?

      if @user.save
        session[:user_id] = @user.id
        
        redirection_path
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def find_user
      @user = User.find_by( email: params[:email], provider: "email" )
    end
end
