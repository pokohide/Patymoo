class Admin::AdminsController < ApplicationController
  layout 'admin_application'
  before_action :set_admin

  def index
    @grade_data = Member.group('grade').count
    @school_data = Member.group('school_name').count
    @school_count = Member.pluck(:school_name).uniq.count
  end

  private

  def set_admin
    redirect_to login_path, notice: 'ログインしてください。' unless @admin = current_user
  end
end
