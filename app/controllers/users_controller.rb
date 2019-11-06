class UsersController < ApplicationController
  before_action :authenticate_user!, except: :create

  before_action :find_user_by_email, only: :create
  before_action :find_user, only: [ :show, :edit, :update ]

  def show
    @reviews = @user.reviews.paginate(page: params[:page], per_page: 3).order(created_at: :desc)
  end

  def new
    @user = User.new
  end

  def create
    unless User.find_by(email: params[:user][:email], provider: "email").nil?
      redirect_to root_path, flash: { danger: "That Email already available!" }
    else
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id        
        redirect_back fallback_location: root_path, flash: { success: "You have successfully sign up!" }
      else
        redirect_back fallback_location: root_path, flash: { danger: validation_errors( @user ) }
      end
    end
  end

  def edit
    if current_user.id == @user.id
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    if @user.update(user_add_info_params)
      redirect_to @user, flash: { success: "You have successfully updated info!" }
    else
      render :edit, flash: { success: "Something wrong!" }
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def find_user_by_email
      @user = User.find_by( email: params[:email], provider: "email" )
    end

    def find_user
      @user = User.find(params[:id])
    end

    def user_add_info_params
      params.require(:user).permit(:name, :phone_number, :image, :password, :password_confirmation)
    end
end
