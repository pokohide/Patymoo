class Admin::AdminsController < ApplicationController
  layout 'admin_application'
  before_action :set_admin

  def index
    @grade_data = @admin.members.group('grade').count
    @school_data = @admin.members.group('school_name').count
    @school_count = @admin.members.pluck(:school_name).uniq.count
  end

  def search
    @q = params[:q]

    @members = @admin.members.like(@q).page(params[:page]).per(5)
    @events = @admin.events.like(@q).page(params[:page]).per(5)
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
