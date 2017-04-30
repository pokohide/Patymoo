class AdminsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :activate], raise: false

  def new
    @admin = Admin.new
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to admins_path(@admin), notice: '新規登録しました。'
    else
      render :new, notice: '登録に失敗しました。'
    end
  end

  def activate
    if (@admin = Admin.load_from_activation_token(params[:id]))
      @admin.activate!
      redirect_to(login_path, notice: 'アカウントが有効になりました。')
    else
      not_authenticated
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:username, :email,
      :password_confirmation, :remember_me, :password)
  end
end
