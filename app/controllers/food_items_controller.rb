class FoodItemsController < ApplicationController
  def index
    @food_items = FoodItem.all
  end

  def new
    @food_items = FoodItem.new
    @restaurant = Restaurant.all
  end

  def create
    @food_items = FoodItem.new(items_params)
    @restaurant = Restaurant.all

    unless @food_items.save
      render "new"
    else 
      redirect_to food_items_path
    end 
  end

  private
    def items_params
      params.require(:food_item).permit(:name, :restaurant_id)
    end



end
