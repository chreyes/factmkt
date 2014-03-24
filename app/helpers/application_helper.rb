module ApplicationHelper
	def formato(numero)
		number_to_currency(numero, delimiter: ".", precision: 0)
	end
end
