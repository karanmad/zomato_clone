class RestaurantsController < ApplicationController
  before_action :require_admin, except: [:index, :show] 
  before_action :require_user
  
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
      flash[:success] = "restaurant is successfully created!"
      redirect_to new_restaurant_path
    end
  end
  
  def show
    @restaurant = Restaurant.find(params[:id])
  end
  
  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    unless @restaurant.update(restaurant_params)
      render "edit"
    else
      flash[:success] = "restaurant is successfully updated!"
      redirect_to "/restaurants"
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
      params.require(:restaurant).permit(:restaurant_name, :address, :email, :phone_no, :table_price, :image, :restaurant_category_id, files: [], pictures: [], photos: [])
    end

end