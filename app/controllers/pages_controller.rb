class PagesController < ApplicationController

  def menu
    @restaurant = Restaurant.find(params[:restaurant])
  end

  def show
  end

  def index
    @restaurant = Restaurant.all
  end

  def edit
    @restaurant = Restaurant.find(params[:format])
  end

  def update
    @restaurant = Restaurant.find(params[:format])
     
    unless @restaurant.update(image_params)
      render "edit"
    else
      flash[:success] = "Image is successfully uploaded!"
      redirect_to restaurant_list_path
    end
  end
 
  private
  def image_params
    params.require(:restaurant).permit(files: [], pictures: [], photos: [])
  end

  
end
