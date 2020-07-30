class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :require_user , except: [:show]
  before_action :require_admin, except: [:show]
  
  def index
    @restaurant = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    unless @restaurant.save
      render "new"
    else
      redirect_to new_restaurant_path, flash: { success: "restaurant is created successfully!" }
    end
  end
  
  def show
  end
  
  def edit
  end

  def update
    unless @restaurant.update(restaurant_params)
      render "edit"
    else
      redirect_to "/restaurants", flash: { success: "Restaurant is updated successfully!" }
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to "/restaurants", flash: { success: "Restaurant is deleted successfully!" }
  end

  private
  
  def restaurant_params
    params.require(:restaurant).permit(:restaurant_name, :address, :email, :phone_no, :table_price, :image, :restaurant_category_id, files: [], pictures: [], photos: [])
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end