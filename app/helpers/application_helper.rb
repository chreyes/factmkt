module ApplicationHelper
	def formato(numero)
		number_with_delimiter(numero, delimiter: ".")
	end
end
