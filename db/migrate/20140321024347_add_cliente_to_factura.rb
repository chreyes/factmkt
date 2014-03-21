class AddClienteToFactura < ActiveRecord::Migration
  def change
    add_column :facturas, :cliente_id, :integer
  end
end
