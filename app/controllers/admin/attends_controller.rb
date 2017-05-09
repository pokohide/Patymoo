class Admin::AttendsController < ApplicationController
  layout 'admin_application'
  before_action :set_admin
  before_action :set_event, only: [:new, :create, :edit, :update, :destroy]

  def new
    @event.members.build
  end

  def create

    if @event.update(members_params)
      redirect_to admin_event_path(@event), notice: '出席登録しました。'
    else
      render :new, notice: '出席登録に失敗しました。'
    end
    # binding.pry
  end

  def edit

  end

  def update

  end

  def destroy
  end

  private
  def set_admin
    redirect_to login_path, notice: 'ログインしてください。' unless @admin = current_user
  end

  def set_event
    @event = @admin.events.find(params[:event_id])
  end

  def members_params
    #params.require(:event).permit(
    #  event_members_attributes: EventMember::NESTED_ALLOWED_PARAMS
    #)
    #
    #
    params.require(:event).permit(
      members_attributes: [:id, :name, :email, :twitter, :facebook,
        :connpass, :grade, :school_type, :school_name, :department,
        :phone_number, :note, :_destroy]
    )
  end
end