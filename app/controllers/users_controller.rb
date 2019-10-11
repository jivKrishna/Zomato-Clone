class UsersController < ApplicationController
  before_action :authenticate_user!, except: :create
  before_action :find_user_by_email, only: :create
  before_action :find_user, only: [ :edit, :update ]

  def index
  end

  def show
    @user = current_user
    @reviews = @user.reviews.paginate(page: params[:page], per_page: 3).order(created_at: :desc)
  end

  def new
    @user = User.new
  end

  def create
    if @user
      @user.errors[:base] << "User already available!"
      render root_path
    else
      @user = User.create(user_params)
      if @user.save
        session[:user_id] = @user.id        
        redirect_to root_path
      end
    end
  end

  def edit
  end

  def update
    @user.phone_number = params[:user][:phone_number] if params[:user][:phone_number].present?
    @user.image = params[:user][:image] if params[:user][:image].present?

    if @user.save
      redirect_to @user
    else
      render :edit
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
end
