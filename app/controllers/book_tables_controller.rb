class BookTablesController < ApplicationController
  before_action :require_user
  before_action :not_admin

  def new
    @restaurant = Restaurant.find(params[:restaurant])
    @book_table = BookTable.new
  end

  def create
    @book_table = current_user.book_tables.new(book_table_params)
    unless @book_table.save
      render "new"
    else
      redirect_to book_tables_path, flash: { success: "Booked successfully!" }
    end
  end

  def index
    @book_table ||= current_user.book_tables.all.reverse
  end

  private
  
  def book_table_params
    params.require(:book_table).permit(:restaurant_id, :heads, :date, :time)
  end

end
