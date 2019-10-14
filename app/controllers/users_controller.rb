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
    @user = User.find_by(email: params[:user][:email], provider: "email")
    unless @user.nil?
      redirect_to root_path, flash: { warning: "You have successfully sign up!" }
    else
      @user = User.create(user_params)
      if @user.save
        session[:user_id] = @user.id        
        redirect_to root_path, flash: { success: "You have successfully sign up!" }
      end
    end
  end

  def edit
  end

  def update
    @user.update(name: params[:user][:name]) if params[:user][:name].present?
    @user.update(image: params[:user][:image]) if params[:user][:image].present?
    @user.update(phone_number: params[:user][:phone_number]) if params[:user][:phone_number].present?

    if @user.update(user_password_params) && @user.save
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

    def user_password_params
      params.require(:user).permit(:password, :password_confirmation)
    end
end
