class BookingTablesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_restaurant,    only: [ :new, :create, :update ]
  before_action :find_table,         only: [ :edit, :update, :destroy ]

  def index
    @booking_tables = current_user.booking_tables.paginate(page: params[:page], per_page: 2).order(created_at: :desc)
  end

  def new
    @booking_table = @restaurant.booking_tables.build
  end

  def create
    @booking_table = @restaurant.booking_tables.build(table_params)
    @booking_table.user_id = current_user.id

    if @booking_table.save
      redirect_to restaurant_booking_tables_path
    else
      render :new
    end
  end

  def edit
    @restaurant = @booking_table.restaurant
  end

  def update
    if @booking_table.update(table_params)
      redirect_back fallback_location: restaurant_booking_tables_path
    else
      render :new
    end
  end

  def destroy
    if @booking_table.destroy
      redirect_to restaurant_booking_tables_path
    end
  end

  private
    def table_params
      params.require(:booking_table).permit( :booking_date, :guest_number, :booking_time, :guest_first_name, :guest_last_name,
       :guest_email, :guest_phone_number )
    end

    def find_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def find_table
      @booking_table = Table.find(params[:id])
    end
end
