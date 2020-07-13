class ApplicationController < ActionController::Base
  include SessionsHelper
  include CartsHelper

  def disable_flash
   @disable_flash = false
  end

end
