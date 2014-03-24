class AddVariosToFactura < ActiveRecord::Migration
  def change
    add_column :facturas, :oc, :string
    add_column :facturas, :gd, :string
    add_column :facturas, :vencimiento, :date
    add_column :facturas, :cp, :string
  end
end
