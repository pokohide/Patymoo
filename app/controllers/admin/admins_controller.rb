class Admin::AdminsController < ApplicationController
  layout 'admin_application'


  def index
    @admin = current_user
  end
end
