class Admin::EventsController < ApplicationController
  include AdminModule
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @q = params[:event_q]
    @events = @admin.events.like(@q).page(params[:page]).per(18)
  end

  def new
    @event = @admin.events.build
  end

  def show
    @members = @event.members.page(params[:page]).per(18)
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
  end

  def update
    if @event.update(event_params)
      redirect_to admin_event_path(@event), notice: "「#{@event.name}」を更新しました。"
    else
      render :edit, notice: 'イベントの編集に失敗しました。'
    end
  end

  def destroy
    @event.destroy
    redirect_to admin_events_path, notice: "「#{@event.name}」を削除しました。"
  end

  private

  def set_event
    @event = @admin.events.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :link, :description, :start_at)
  end
end
