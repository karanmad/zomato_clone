# frozen_string_literal: true

class RestaurantsController < ApplicationController
  before_action :set_all_restaurant, only: %i[index list]
  before_action :set_restaurant, only: %i[show edit update destroy map upload_image upload menu]
  before_action :require_user, except: %i[show map menu]
  before_action :require_admin, except: %i[show map menu]

  def index; end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to new_restaurant_path, flash: { success: 'restaurant is created successfully!' }
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurants_path, flash: { success: 'Restaurant is updated successfully!' }
    else
      render 'edit'
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path, flash: { success: 'Restaurant is deleted successfully!' }
  end

  def map; end

  def list; end

  def upload_image; end

  def upload
    if params[:restaurant].nil?
      flash[:danger] = 'you have not selected anything!'
      render 'upload_image'
    else
      if @restaurant.update(restaurant_params)
        redirect_to list_restaurants_path, flash: { success: 'Image is successfully uploaded!' }
      else
        render 'upload_image'
      end
    end
  end

  def menu; end

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
