class AdminsController < ApplicationController
  skip_before_action :require_login, except: [:show], raise: false

  def new
    @admin = Admin.new
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to admin_path(@admin), notice: '新規登録しました。'
    else
      render :new, notice: '登録に失敗しました。'
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:username, :email
      :password_confirmation, :remember_me, :password)
  end
end