class Admin::MembersController < ApplicationController
  layout 'admin_application'
  before_action :set_admin

  def index
    @members = @admin.members.page(params[:page]).per(18)
    # @chart_data = {'2014-04-01' => 60, '2014-04-02' => 65, '2014-04-03' => 64}

    @grade_data = Member.group('grade').count
    @school_data = Member.group('school_name').count

    @school_count = Member.pluck(:school_name).uniq.count
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
    @member = @admin.members.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
  def set_admin
    redirect_to login_path, notice: 'ログインしてください。' unless @admin = current_user
  end

  def member_params
    params.require(:member).permit(:name, :email, :twitter, :facebook,
      :connpass, :grade, :school_type, :school_name, :department,
      :phone_number, :note)
  end
end
