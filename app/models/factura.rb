class Factura < ActiveRecord::Base
	belongs_to :cliente
	has_many :items

	accepts_nested_attributes_for :items, :reject_if => :all_blank

	def neto
		@neto ||= items.inject(0) {|total, item| total += item.total}
		@neto		
	end

	def iva
		neto * 0.19
	end

	def total
		neto + iva
	end
end