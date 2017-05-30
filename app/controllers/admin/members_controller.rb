class Admin::MembersController < ApplicationController
  include AdminModule
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  def index
    @q = params[:member_q]
    @members = @admin.members
    @grade_data = convert @members.graph_data('grade')
    @school_data = convert @members.graph_data('school_name')
    @depeartment_data = convert @members.graph_data('department')
    @school_count = @admin.members.pluck(:school_name).uniq.count
    @members = @members.like(@q).page(params[:page]).per(18)
  end

  def new
    @member = @admin.members.build
  end

  def show
    @member = @admin.members.find(params[:id])
  end

  def create
    @member = @admin.members.new(member_params)
    if @member.save
      redirect_to admin_members_path, notice: 'メンバーを追加しました。'
    else
      render :new, notice: 'メンバーの追加に失敗しました。'
    end
  end

  def edit
  end

  def update
    if @member.update(member_params)
      redirect_to admin_member_path(@member), notice: "「#{@member.name}」を更新しました。"
    else
      render :edit, notice: 'メンバーの編集に失敗しました。'
    end
  end

  def destroy
    @member.destroy
    redirect_to admin_members_path, notice: "「#{@member.name}」を削除しました。"
  end

  private

  def set_member
    @member = @admin.members.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:name, :email, :twitter, :facebook,
      :connpass, :grade, :school_type, :school_name, :department,
      :phone_number, :note)
  end
end
