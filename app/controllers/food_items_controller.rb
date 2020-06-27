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

    unless @food_items.save
      render "new"
    else 
      flash[:success] = "food item create successfully!"
      redirect_to food_items_path
    end 
  end

  def edit
    @food_items = FoodItem.find(params[:id])
    @restaurant = Restaurant.all
  end

  def update
    @food_items = FoodItem.find(params[:id])
  
    unless @food_items.update(items_params)
       render "edit"
    else
      flash[:success] = "food item is  updated succesfully!"
      redirect_to food_items_path
    end
  end

  def destroy
    food_items = FoodItem.find(params[:id])
    food_items.destroy
    flash[:success] = "food item is deleted successfully!"
    redirect_to food_items_path
  end

  private
    def items_params
      params.require(:food_item).permit(:name, :price, :restaurant_id)
    end



end
