# frozen_string_literal: true

class BookTablesController < ApplicationController
  before_action :set_restaurant, only: %i[new create]
  before_action :require_user
  before_action :only_user

  def new
    @book_table = BookTable.new
  end

  def create
    @book_table = current_user.book_tables.new(book_table_params)

    if @book_table.save
      redirect_to book_tables_path, flash: { success: 'Booked successfully!' }
    else
      render 'new'
    end
  end

  def index
    @book_table ||= current_user.book_tables.all.reverse
  end

  private
  
  def book_table_params
    params.require(:book_table).permit(:restaurant_id, :heads, :date, :time)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant])
  end
end
