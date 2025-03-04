class ApplicationController < ActionController::Base
  layout "back_office"
  helper_method :current_cart

  def current_cart
    session[:cart] ||= {}
  end

  # Redirige al usuario a la sección de productos después de iniciar sesión
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
  
end
