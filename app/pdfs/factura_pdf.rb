class FacturaPdf < Prawn::Document
	def initialize(factura, view)
		super(top_margin: 190)
		@factura = factura 
		@view = view
		datos_factura
		datos_items
		datos_totales
	end

	def datos_factura
		indent(50) do 
			font "Courier"
			text "#{@factura.cliente.nombre}", size: 14, style: :normal
			move_down 3
			text "#{@factura.cliente.direccion}" , size: 12, style: :normal
			text "#{@factura.cliente.ciudad}" , size: 12, style: :normal
		end
		move_down 18
		indent(1) do 
			font "Courier"
			text "#{@factura.fecha.strftime("%d/%m/%Y")}" + "    "  + "#{@factura.cliente.rut}" + "     " + "#{@factura.cliente.giro}", size: 12, style: :normal 
		end
	end

	def datos_items
		move_down 76
		indent(15) do
			table(filas_items, :column_widths => [40,342,68,70], :cell_style => {:border_color => "FFFFFFFF", :padding => 0}) 
		end
	end

	def filas_items
		[["","","",""]] +
		@factura.items.map do |item|
			font "Courier"
			font_size 14
			[item.cantidad, item.detalle, formato(item.precio), formato(item.total)]
		end
	end

	def datos_totales
		move_cursor_to 105
		indent(475) do 
			font "Courier"
			text "#{formato(@factura.neto)}", size: 15, style: :bold
			move_down 5
			text "#{formato(@factura.iva.round)}", size: 15, style: :bold
			move_down 5
			text "#{formato(@factura.total.round)}", size: 15, style: :bold
		end
	end

	def formato(numero)
		@view.number_with_delimiter(numero, delimiter: ".")
	end
end
