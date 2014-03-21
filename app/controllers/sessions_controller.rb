class SessionsController < ApplicationController
  def new
  end

  def create
	  usuario = Usuario.find_by_email(params[:email])
	  if usuario && usuario.authenticate(params[:password])
		  session[:usuario_id] = usuario.id
		  redirect_to root_url, notice: "Ingreso ok!"
	  else
		  flash.now.alert = "Email o clave inválidos"
		  render "new"
	  end
  end

  def destroy
	  session[:usuario_id] = nil  	
	  redirect_to root_url, notice: "Deslogeado!"
  end
end
