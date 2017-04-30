class PasswordResetsController < ApplicationController
  skip_before_action :require_login, raise: false

  def create
    @admin = Admin.find_by_email(params[:email])
    @admin.deliver_reset_password_instructions! if @admin.present?
    redirect_to login_path, notice: 'パスワードを変更するメールを送信しました。'
  end

  def edit
    set_token_user_from_params?
  end

  def update
    return unless set_token_user_from_params?
    @admin.password_confirmation = params[:admin][:password_confirmation]
    if @admin.change_password(params[:admin][:password])
      redirect_to login_path, notice: 'パスワードを更新しました。'
    else
      render :edit
    end
  end

  private
  def set_token_user_from_params?
    @token = params[:id]
    @admin = Admin.load_from_reset_password_token(@token)
    if @admin.blank?
      not_authenticated
      return false
    else
      return true
    end
  end
end
