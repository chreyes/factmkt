class Item < ActiveRecord::Base
	belongs_to :factura

	def total
		precio * cantidad
	end


end
