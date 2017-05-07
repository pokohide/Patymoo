class Admin::EventsController < ApplicationController
  layout 'admin_application'
  before_action :set_admin

  def index
    @events = @admin.events.page(params[:page]).per(18)
  end

  def new
    @event = @admin.events.build
  end

  def show
    @event = @admin.events.find(params[:id])
  end

  def create
    @event = @admin.events.new(event_params)
    if @event.save
      redirect_to admin_events_path, notice: 'イベントを追加しました。'
    else
      render :new, notice: 'イベントの追加に失敗しました。'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update

  end

  def destroy

  end

  private
  def set_admin
    redirect_to login_path, notice: 'ログインしてください。' unless @admin = current_user
  end

  def event_params
    params.require(:event).permit(:name, :link, :description, :start_at)
  end
end
