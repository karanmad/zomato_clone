# frozen_string_literal: true

class AdminDashboardsController < ApplicationController
  before_action :require_admin, only: [:index]

  def index; end

  def error; end
end
