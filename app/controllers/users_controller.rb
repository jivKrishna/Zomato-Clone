class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :admin_registration]
  before_action :authenticate_admin!, only: :index

  def show
    @user = current_user
  end

  def index
  end

  def admin_registration
    @user = User.new
  end

  def create
    @user = current_user
    
    if(params[:user][:admin])
      if(@user.update(admin: true))
        redirect_to root_path, notice: "You are Admin now!"
      end
    else
      @user.errors[:admin].add("Please confirm")
      redirect_to :new
    end
  end

  private
    def admin_params
      params.require(:admin).permit(:name, :email, :type)
    end
end
