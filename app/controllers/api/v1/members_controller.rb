class Api::V1::MembersController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_admin

  def search
    q, page = params[:q], params[:page]
    @members = @admin.members.like(q).page(page).per(18)
  end

  def attend
    @event = @admin.events.find(params[:event_id])
    @member = @admin.members.find_or_create_by()
    # if params[:member_id]
    binding.pry
  end

  def disattend
    @event = @admin.events.find(params[:event_id])
    @member = @admin.members.find(params[:member_id])

    # event_member = EventMember.find_by(event_id: @event.id, member_id: @member.id)
    @message = "#{params[:event_id]}と#{params[:member_id]}だよー"
    # @message = if event_member.destroy
    #             "[#{@event.name}]から「#{@member.name}」の出席を取り消しました。"
    #            else
    #              "出席の取り消しに失敗しました。"
    #            end
  end

  private
  def set_admin
    @admin = current_user
    return head(:not_found) if @admin.nil?
  end

  def member_params
    params.require(:member).permit(:name, :email, :twitter, :facebook,
      :connpass, :grade, :school_type, :school_name, :department,
      :phone_number, :note)
  end
end
