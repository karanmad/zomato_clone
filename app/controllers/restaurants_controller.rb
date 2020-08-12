class RestaurantsController < ApplicationController
  before_action :set_all_restaurant, only: [:index, :list]
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy, :map, :upload_image, :upload, :menu]
  before_action :require_user , except: [:show, :map, :menu]
  before_action :require_admin, except: [:show, :map, :menu]
  
  def index
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

  def map
  end

  def list
  end

  def upload_image
  end

  def upload 
    unless params[:restaurant].nil?
      unless @restaurant.update(restaurant_params)
        render "upload_image"
      else
        redirect_to list_restaurants_path, flash: { success: "Image is successfully uploaded!" }
      end
    else
      flash[:danger] = "you have not selected anything!"
      render "upload_image"
    end
  end


  def menu
  end

  private
  
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :email, :phone_no, :table_price, :image, :category_id, files: [], pictures: [], photos: [])
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
  
  def set_all_restaurant
    @restaurant = Restaurant.all
  end

end