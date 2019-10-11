class MenuCardsController < ApplicationController
  before_action :find_restaurant, only: [ :index, :create, :update, :destroy ]
  before_action :find_menu_card,  only: [ :show, :update, :destroy ] 

  def index
    @menu_cards = MenuCard.paginate(page: params[:page], per_page: 6)
  end

  def show
  end

  def create
    @menu_card = @restaurant.menu_cards.create(menu_card_params)

    if @menu_card.save
      redirect_to restaurant_menu_cards_path(@restaurant)
    end
  end

  def edit
  end

  def update

  end

  def destroy
    if @menu_card.destroy
      redirect_to restaurant_menu_cards_path(@restaurant)
    end
  end

  private
    def find_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def find_menu_card
      @menu_card = MenuCard.find(params[:id])
    end

    def menu_card_params
      params.require(:menu_card).permit(:image, :description)
    end
end
