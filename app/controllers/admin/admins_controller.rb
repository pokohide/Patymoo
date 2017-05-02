class Admin::AdminsController < ApplicationController
  layout 'admin'


  def index
    @admin = current_user
  end
end
