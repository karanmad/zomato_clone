class RestaurantCategoriesController < ApplicationController
  before_action :set_category, only: [:new, :create]
  before_action :require_user
  before_action :require_admin
  
  def new
  end

  def create
    @category.name = params[:restaurant_category][:name]

    unless @category.save
      render "new"
    else
      redirect_to new_restaurant_category_path, flash: { success: "Restaurant category is added successfully!" }
    end
  end

  private
  
  def set_category
    @category = RestaurantCategory.new
  end
  
end
