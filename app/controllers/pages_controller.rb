class PagesController < ApplicationController

  def menu
    @restaurant = Restaurant.find(params[:restaurant])
  end

  def show
  end
end
