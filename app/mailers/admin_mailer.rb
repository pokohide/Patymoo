class AdminMailer < ActionMailer::Base
  default from: 'othlotech@gmail.com', template_path: 'mailers/admin_mailer'
  add_template_helper(ApplicationHelper)
  layout 'mailer'

  def activation_needed_email(admin)
    root_url = 'http://localhost:3000/'
    @admin = admin
    @url  = "#{root_url}admins/#{admin.activation_token}/activate"
    mail to: admin.email,
         subject: "ようこそ、Partyへ"
  end

  def activation_success_email(admin)
    root_url = 'http://localhost:3000/'
    @admin = admin
    # @club = @admin.try(:club)
    @url  = "#{root_url}login"
    mail to: admin.email,
         subject: 'メール認証が完了しました。'
  end

  def reset_password_email(admin)
    @admin = Admin.find(admin.id)
    # @club = @user.try(:club)
    @url  = edit_password_reset_url(@admin.reset_password_token)
    mail to: admin.email,
         subject: 'パスワードはリセットされました。'
  end
end
