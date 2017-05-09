class Api::V1::MembersController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_admin

  def search
    q, page = params[:q], params[:page]
    @members = @admin.members.like(q).page(page).per(18)
  end

  private
  def set_admin
    @admin = current_user
    return head(:not_found) if @admin.nil?
  end
end
