class FacturaPdf < Prawn::Document
	def initialize(factura, view)
		super(top_margin: 190)
		@factura = factura 
		@view = view
		datos_factura
		datos_items
		total_palabras
		datos_totales
	end

	def datos_factura
		indent(50) do 
			font "Courier"
			move_down 5
			define_grid(:columns => 5, :rows => 40, :gutter=> 2)
			grid([0,0], [0,4]).bounding_box do
				text "#{@factura.cliente.nombre}", size: 12, style: :normal
			end
			grid([1,0], [1,4]).bounding_box do
				text "#{@factura.cliente.direccion}" , size: 12, style: :normal
			end
			grid([2,0], [2,4]).bounding_box do
				text "#{@factura.cliente.ciudad}" , size: 12, style: :normal
			end
		end
		indent(1) do 
			font "Courier"
			define_grid(:columns => 5, :rows => 40, :gutter=> 2)
			grid(4,0).bounding_box do
				text "#{@factura.fecha.strftime("%d/%m/%Y")}", size: 12, style: :normal
			end
			grid(4,1).bounding_box do
				text "#{@factura.cliente.rut}", size: 12, style: :normal
			end
			grid([4,2],[4,3]).bounding_box do
				text "#{@factura.cliente.giro}", size: 12, style: :normal
			end
			grid(4,4).bounding_box do
				text "#{@factura.vencimiento.strftime("%d/%m/%Y")}", size: 12, style: :normal
			end
			grid(7,0).bounding_box do
				text "#{@factura.oc}", size: 12, style: :normal
			end
			grid([7,1],[7,3]).bounding_box do
				text "#{@factura.gd}", size: 12, style: :normal
			end
			grid(7,4).bounding_box do
				text "#{@factura.cp}", size: 12, style: :normal
			end
		end
	end

	def datos_items
		move_down 45
		indent(15) do
			table(filas_items, :column_widths => [44,334,72,72], :cell_style => {:border_color => "FFFFFFFF", :padding => 0}) 
		end
	end

	def filas_items
		[["","","",""]] +
		@factura.items.map do |item|
			font "Courier"
			font_size 12
			[item.cantidad, item.detalle, formato(item.precio), formato(item.total)]
		end
	end

	def total_palabras
			font "Courier"
			define_grid(:columns => 6, :rows => 45, :gutter=> 1)
			grid([33,3],[34,5]).bounding_box do
				text "#{@factura.tp}" + " pesos", size: 10, style: :normal
			end
		
	end

	def datos_totales
		move_cursor_to 105
		indent(468) do 
			font "Courier"
			text "#{formato(@factura.neto)}", size: 12, style: :bold
			move_down 5
			text "#{formato(@factura.iva.round)}", size: 12, style: :bold
			move_down 5
			text "#{formato(@factura.total.round)}", size: 12, style: :bold
		end
	end

	def formato(numero)
		@view.number_with_delimiter(numero, delimiter: ".")
	end
end
