class RestaurantsController < ApplicationController
  before_action :require_admin
  
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
    @restaurant_category = RestaurantCategory.all
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    unless @restaurant.save
      render "new"
    else
      flash[:success] = "restaurant is successfully created!"
      redirect_to new_restaurant_path
    end
  end
  
  def show
    @restaurant = Restaurant.find(params[:id])
  end
  
  def edit
    @restaurant = Restaurant.find(params[:id])
    @restaurant_category = RestaurantCategory.all
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update(restaurant_params)
      flash[:success] = "restaurant is successfully updated!"
      redirect_to "/restaurants"
    else
      render "edit"
      
    end
  end

  def destroy
    restaurant = Restaurant.find(params[:id])
    restaurant.destroy
    flash[:success] = "restaurant is deleted successfully!"
    redirect_to "/restaurants"
  end

  private
    def restaurant_params
      params.require(:restaurant).permit(:restaurant_name, :address, :email, :phone_no, :restaurant_category_id)
    end

end