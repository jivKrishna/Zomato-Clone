class TablesController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]
  before_action :find_restaurant,    only: [ :new, :create ]

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

  private
    def table_params
      params.require(:table).permit( :book_date, :book_time, :guest_email, :guest_phone_number )
    end

    def find_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end
end
