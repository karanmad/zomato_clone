class ApplicationController < ActionController::Base
  include SessionsHelper
  include CartsHelper
  include OrdersHelper
  include ReviewsHelper
end
