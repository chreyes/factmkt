class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def current_usuario
	  @current_usuario ||= Usuario.find(session[:usuario_id]) if session[:usuario_id]
  end

  helper_method :current_usuario

  def authorize
  	redirect_to login_url, alert: "Ingrese primero" if current_usuario.nil?
  end
end
