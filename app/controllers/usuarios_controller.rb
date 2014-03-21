class UsuariosController < ApplicationController
	before_action :set_usuario, only: [:show, :edit, :update, :destroy]

	def new
		@usuario = Usuario.new
	end

	def create
		@usuario = Usuario.new(user_params)
		if @usuario.save
			session[:usuario_id] = @usuario.id
			redirect_to root_url, notice: "Usuario registrado correctamente."
		else
			render "new"
			
		end
	end
  
	private

	def set_usuario
		@usuario = Usuario.find(params[:id])
	end

	def user_params
		params.require(:usuario).permit(:email, :password, :password_confirmation)
	end

end
