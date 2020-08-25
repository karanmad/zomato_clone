class FoodItemsController < ApplicationController
  before_action :set_food, only: [:edit, :update, :destroy]
  before_action  :set_restaurant, only: [:new, :create, :edit]
  before_action :require_user
  before_action :require_admin
  
  def index
    @food_items = FoodItem.all
  end

  def new
    @food_items = FoodItem.new
  end

  def create
    @food_items = FoodItem.new(items_params)

    unless @food_items.save
      render "new"
    else 
      redirect_to food_items_path, flash: { success: "fooditem is created successfully!" }
    end 
  end

  def edit
  end

  def update 
    unless @food_items.update(items_params)
       render "edit"
    else
      redirect_to food_items_path, flash: { success: "fooditem is updated successfully!" }
    end
  end

  def destroy
    @food_items.destroy
    redirect_to food_items_path, flash: { success: "fooditem is deleted successfully!" }
  end

  private
  
  def items_params
    params.require(:food_item).permit(:name, :price, :restaurant_id)
  end
  
  def set_food
    @food_items = FoodItem.find(params[:id])
  end

  def set_restaurant
    @restaurant ||= Restaurant.all
  end 
end
