class TablesController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]
  before_action :find_restaurant,    only: [ :new, :create, :edit, :update ]
  before_action :find_table,         only: [ :edit, :update, :destroy ]

  def new
    @table = @restaurant.tables.build
  end

  def create
    @table = @restaurant.tables.build(table_params)
    @table.user_id = current_user.id

    if @table.save
      redirect_to @restaurant
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @table.update(table_params)
      redirect_to @restaurant
    else
      render :new
    end
  end

  private
    def table_params
      params.require(:table).permit( :book_date, :guest_number, :book_time, :guest_first_name, :guest_last_name,
       :guest_email, :guest_phone_number )
    end

    def find_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def find_table
      @table = @restaurant.tables.find(params[:id])
    end
end
