# frozen_string_literal: true

module SessionsHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    redirect_to login_path, flash: { danger: 'You must log in to continue!' } unless logged_in?
  end

  def only_user
    unless logged_in? && !current_user.admin?
      redirect_to error_path, flash: { danger: 'you must login in as user to perform this action' }
    end
  end

  def require_admin
    unless logged_in? && current_user.admin?
      redirect_to error_path, flash: { danger: 'only admin can perform this action!' }
    end
  end
end
