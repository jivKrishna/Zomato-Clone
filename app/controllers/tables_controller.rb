class TablesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_restaurant,    only: [ :new, :create, :update ]
  before_action :find_table,         only: [ :edit, :update, :destroy ]

  def index
    @tables = current_user.tables.all.order(created_at: :desc)
  end

  # def show
  # end

  def new
    @table = @restaurant.tables.build
  end

  def create
    @table = @restaurant.tables.build(table_params)
    @table.user_id = current_user.id

    if @table.save
      redirect_to restaurant_tables_path
    else
      render :new
    end
  end

  def edit
    @restaurant = @table.restaurant
  end

  def update
    if @table.update(table_params)
      redirect_to restaurant_tables_path
    else
      render :new
    end
  end

  def destroy
    if @table.destroy
      redirect_to restaurant_tables_path
    end
  end

  private
    def table_params
      params.require(:table).permit( :booking_date, :guest_number, :booking_time, :guest_first_name, :guest_last_name,
       :guest_email, :guest_phone_number )
    end

    def find_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def find_table
      @table = Table.find(params[:id])
    end
end
