class RestaurantCategoriesController < ApplicationController
  def new
    @category = RestaurantCategory.new
  end

  def create
    @category = RestaurantCategory.new
    @category.name = params[:restaurant_category][:name]

    unless @category.save
      render "new"
    else
      redirect_to restaurants_path
    end
    
  end
end
