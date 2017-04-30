class SitesController < ApplicationController
  skip_before_action :require_login, only: [:index, :about], raise: false

  def index
  end

  def about
  end
end
