Rails.application.config.sorcery.submodules = [:user_activation, :remember_me,
  :reset_password, :session_timeout, :brute_force_protection, :activity_logging, :external]

Rails.application.config.sorcery.configure do |config|
  # When a non logged in user tries to enter a page that requires login, save
  # the URL he wanted to reach, and send him there after login, using 'redirect_back_or_to'.
  # Default: `true`
  #
  # config.save_return_to_url =

  # Set domain option for cookies; Useful for remember_me submodule.
  # Default: `nil`
  #
  # config.cookie_domain =

  # Allow the remember_me cookie to be set through AJAX
  # Default: `true`
  #
  # config.remember_me_httponly =

  # -- session timeout --
  config.session_timeout = 30.minutes
  config.session_timeout_from_last_action = false

  # -- Oauth --
  # config.external_providers = [:twitter, :facebook]
  # config.twitter.key = 'eYVNBjBDi33aa9GkA3w'
  # config.twitter.secret = 'XpbeSdCoaKSmQGSeokz5qcUATClRW5u08QWNfv71N8'
  # config.twitter.callback_url = 'http://0.0.0.0:3000/oauth/callback?provider=twitter'
  # config.twitter.user_info_mapping = { email: 'screen_name' }

  # config.facebook.key = '34cebc81c08a521bc66e212f947d73ec'
  # config.facebook.secret = '5b458d179f61d4f036ee66a497ffbcd0'
  # config.facebook.callback_url = 'http://0.0.0.0:3000/oauth/callback?provider=facebook'
  # config.facebook.user_info_mapping = { email: 'name' }


  # -- activity logging --
  # will register the time of last user login, every login.
  # Default: `true`
  #
  # config.register_login_time =

  # will register the time of last user logout, every logout.
  # Default: `true`
  #
  # config.register_logout_time =

  # will register the time of last user action, every action.
  # Default: `true`
  #
  # config.register_last_activity_time =

  # -- external --
  # What providers are supported by this app, i.e. [:twitter, :facebook, :github, :linkedin, :xing, :google, :liveid, :salesforce, :slack] .
  # Default: `[]`
  #
  # config.external_providers =

  # You can change it by your local ca_file. i.e. '/etc/pki/tls/certs/ca-bundle.crt'
  # Path to ca_file. By default use a internal ca-bundle.crt.
  # Default: `'path/to/ca_file'`
  #
  # config.ca_file =

  # Twitter will not accept any requests nor redirect uri containing localhost,
  # make sure you use 0.0.0.0:3000 to access your app in development
  #
  # config.twitter.key = ""
  # config.twitter.secret = ""
  # config.twitter.callback_url = "http://0.0.0.0:3000/oauth/callback?provider=twitter"
  # config.twitter.user_info_mapping = {:email => "screen_name"}
  #
  # config.facebook.key = ""
  # config.facebook.secret = ""
  # config.facebook.callback_url = "http://0.0.0.0:3000/oauth/callback?provider=facebook"
  # config.facebook.user_info_mapping = {:email => "name"}
  # config.facebook.access_permissions = ["email", "publish_actions"]
  # config.facebook.display = "page"
  # config.facebook.api_version = "v2.2"

  # config.paypal.key = ""
  # config.paypal.secret = ""
  # config.paypal.callback_url = "http://0.0.0.0:3000/oauth/callback?provider=paypal"
  # config.paypal.user_info_mapping = {:email => "email"}

  # config.google.key = ""
  # config.google.secret = ""
  # config.google.callback_url = "http://0.0.0.0:3000/oauth/callback?provider=google"
  # config.google.user_info_mapping = {:email => "email", :username => "name"}
  # config.google.scope = "https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile"

  # --- user config ---
  config.user_config do |user|
    user.username_attribute_names = [:email]
    # user.user_activation_mailer = UserMailer
    user.user_activation_mailer = AdminMailer
    user.activation_token_attribute_name = :activation_code
    user.activation_token_expires_at_attribute_name = :activation_code_expires_at

    user.subclasses_inherit_config = true

    # user.reset_password_mailer = UserMailer
    user.reset_password_mailer = AdminMailer
    user.reset_password_expiration_period = 10.minutes
    user.reset_password_time_between_emails = 5 * 60 # (s) nil

    user.activity_timeout = 1.minutes

    user.consecutive_login_retries_amount_limit = 10
    user.login_lock_time_period = 2.minutes
    user.unlock_token_mailer = AdminMailer

    user.remember_me_for = 604800

    # 外部サービス連携する場合に使用
    # user.authentications_class = UserProvider
  end

  config.user_class = 'Admin'
end
