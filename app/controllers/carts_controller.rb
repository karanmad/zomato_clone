# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :require_user, only: [:show]

  def show
    @cart_items = current_cart.cart_items.all
  end
end
