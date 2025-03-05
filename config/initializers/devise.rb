Devise.setup do |config|
  # Configura el remitente del mailer de Devise.
  config.mailer_sender = 'please-change-me@example.com'

  # Carga el ORM para ActiveRecord
  require 'devise/orm/active_record'

  # Configuraciones de autenticación
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  
  # Saltos y otros ajustes
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 12
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.reset_password_within = 6.hours
  
  # Configura que el cierre de sesión se haga vía GET
  config.sign_out_via = :get
end



 
