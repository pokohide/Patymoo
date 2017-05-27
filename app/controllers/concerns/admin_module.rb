module AdminModule
  extend ActiveSupport::Concern

  included do
    before_action :set_admin
    layout 'admin_application'
  end

  def convert hash
    convert_table = Member.school_types_i18n
    convert_table.merge!(Member.grades_i18n)
    convert_table.merge!({ nil => '未登録', '' => '未登録' })

    hash.each_with_object({}) do |(key, value), new_hash|
      new_hash[convert_table[key]] = value
    end
  end

  private

  def set_admin
    redirect_to login_path, notice: 'ログインしてください。' unless @admin = current_user
  end
end
