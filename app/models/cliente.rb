class Cliente < ActiveRecord::Base
	has_many :facturas

	validates :nombre, :direccion, :ciudad, :rut, :giro, :presence => true
	validates :nombre, :rut,  :uniqueness => true
end
