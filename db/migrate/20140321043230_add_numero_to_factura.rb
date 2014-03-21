class AddNumeroToFactura < ActiveRecord::Migration
  def change
    add_column :facturas, :numero, :integer
  end
end
