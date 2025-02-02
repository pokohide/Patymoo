class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy], raise: false

  def new
    @admin = Admin.new
  end

  def create
    if @admin = login(*login_params)
      redirect_back_or_to admin_dashboard_path(@admin), notice: 'ログインしました。'
    else
      invalid_admin = Admin.find_by(email: params[:email])
      flash.now[:alert] = if invalid_admin.present?
                            'このアカウントはロックされています。'
                          else
                            'メールアドレスかパスワードが不適切です。'
                          end
      render :new
    end
  end

  def destroy
    remember_me!
    forget_me!
    logout
    redirect_to login_path, notice: 'ログアウトしました。'
  end

  private

  def login_params
    [params[:email], params[:password], params[:remember_me]]
  end
end
