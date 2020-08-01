class ApplicationController < ActionController::Base
  include SessionsHelper
  include CartsHelper
  include RestaurantsHelper
  include OrdersHelper
  include ReviewsHelper
end
