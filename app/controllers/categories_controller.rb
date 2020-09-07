# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: %i[new create]
  before_action :require_user
  before_action :require_admin

  def new; end

  def create
    @category.name = params[:category][:name]

    if @category.save
      redirect_to new_category_path, flash: { success: 'Restaurant category is added successfully!' }
    else
      render 'new'
    end
  end

  private

  def set_category
    @category = Category.new
  end
end
