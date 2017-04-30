class AdminsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def show
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to admin_path(@admin), notice: '新規登録しました。'
    else
      render :new, notice: '登録に失敗しました。'
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:username, :email, :password)
  end
end
