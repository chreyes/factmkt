class ClientePdf < Prawn::Document
	def initialize(cliente)
		super(top_margin: 200)
		@cliente = cliente
		datos_cliente
	end

	def datos_cliente
		indent(50) do 
			text "#{@cliente.nombre}"
			text "#{@cliente.direccion}"
			text "#{@cliente.ciudad}"
		end
		move_down 20
		indent(150) do 
			text "#{@cliente.rut}" + "       " +	"#{@cliente.giro}"
		end
	end
end
