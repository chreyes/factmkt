class FacturaPdf < Prawn::Document
	def initialize(factura, view)
		super(top_margin: 230)
		@factura = factura 
		@view = view
		datos_factura
		datos_items
		datos_totales
	end

	def datos_factura
		indent(50) do 
			text "#{@factura.cliente.nombre}", size: 12, style: :bold 
			text "#{@factura.cliente.direccion}" , size: 12, style: :normal
			text "#{@factura.cliente.ciudad}" , size: 12, style: :normal
		end
		move_down 20
		indent(1) do 
			text "#{@factura.fecha.strftime("%d/%m/%Y")}" + "                "  + "#{@factura.cliente.rut}" + "                    " + "#{@factura.cliente.giro}", size: 10, style: :normal 
		end
	end

	def datos_items
		move_down 70
		indent(15) do
			table(filas_items, :column_widths => [30,360,60,70], :cell_style => {:border_color => "FFFFFFFF"}) 
		end
	end

	def filas_items
		[["","","",""]] +
		@factura.items.map do |item|
			[item.cantidad, item.detalle, formato(item.precio), formato(item.total)]
		end
	end

	def datos_totales
		move_cursor_to 70
		indent(450) do 
			text "#{formato(@factura.neto)}"
			text "#{formato(@factura.iva.round)}"
			text "#{formato(@factura.total.round)}"
		end
	end

	def formato(numero)
		@view.number_with_delimiter(numero, delimiter: ".")
	end
end
