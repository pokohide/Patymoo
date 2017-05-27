class Admin::AdminsController < ApplicationController
  include AdminModule

  def index
    @grade_data = convert @admin.members.graph_data('grade')
    @school_data = convert @admin.members.graph_data('school_name')
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

  def admin_params
    params.require(:admin).permit(:username, :email)
  end
end
