class Admin::AdminsController < ApplicationController
  layout 'admin_application'
  before_action :set_admin

  def index
    @grade_data = Member.group('grade').count
    @school_data = Member.group('school_name').count
    @school_count = Member.pluck(:school_name).uniq.count
  end

  def edit
  end

  def update
    if @admin.update(admin_params)
      redirect_to admin_dashboard_path, notice: 'プロフィールを編集しました。'
    else
      render :edit, notice: 'プロフィールの編集に失敗しました。'
    end
  end

  private

  def set_admin
    redirect_to login_path, notice: 'ログインしてください。' unless @admin = current_user
  end

  def admin_params
    params.require(:admin).permit(:username, :email)
  end
end
