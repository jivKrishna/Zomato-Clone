class MenuCardsController < ApplicationController
  before_action :authenticate_admin!, only: [ :create, :edit, :update, :destroy ]
  before_action :find_restaurant, only: [ :index, :create, :edit, :update, :destroy ]
  before_action :find_menu_card,  only: [ :edit, :update, :destroy ] 

  def index
    @menu_cards = MenuCard.all
  end

  def create
    @menu_card = @restaurant.menu_cards.create(menu_card_params)

    if @menu_card.save
      redirect_back fallback_location: restaurant_menu_cards_path(@restaurant), flash: { success: "Menu added successfully!" }
    else
      redirect_back fallback_location: restaurant_menu_cards_path(@restaurant), flash: { danger: "Something missed!" }     
    end
  end

  def edit
  end

  def update
    if @menu_card.update(menu_card_params)
      redirect_to restaurant_menu_cards_path(@menu_card.restaurant), flash: { success: "Menu updated successfully!" }
    else
      redirect_back fallback_location: restaurant_menu_cards_path(@restaurant), flash: { danger: "Something missed!" }
    end
  end

  def destroy
    if @menu_card.destroy
      redirect_to restaurant_menu_cards_path(@restaurant), flash: { success: "Menu deleted successfully!" }
    else
      redirect_back fallback_location: restaurant_menu_cards_path(@restaurant), flash: { danger: "Something missed!" }
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
