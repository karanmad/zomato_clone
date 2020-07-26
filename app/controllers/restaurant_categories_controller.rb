class RestaurantCategoriesController < ApplicationController
  before_action :require_user
  before_action :require_admin
  
  def new
    @category = RestaurantCategory.new
  end

  def create
    @category = RestaurantCategory.new
    @category.name = params[:restaurant_category][:name]

    unless @category.save
      render "new"
    else
      flash[:success] = "Category added successfully!"
      redirect_to new_restaurant_category_path
    end
  end

end
