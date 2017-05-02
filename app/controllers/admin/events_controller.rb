class Admin::EventsController < ApplicationController
  layout 'admin_application'
  before_action :set_admin

  def index
  end

  def new
    @event = @admin.events.build
  end

  private
  def set_admin
    redirect_to login_path, notice: 'ログインしてください。' unless @admin = current_user
  end
end
