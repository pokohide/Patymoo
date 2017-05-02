# Be sure to restart your server when you modify this file.

# Rails.application.config.session_store :cookie_store, key: '_Party_session'

if Rails.env.production?
  Rails.application.config.session_store :cookie_store, key: '_Party_session', domain: 'example.com'
else
  Rails.application.config.session_store :cookie_store, key: '_Party_session', domain: 'lvh.me'
end
