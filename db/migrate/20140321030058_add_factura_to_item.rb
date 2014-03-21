class AddFacturaToItem < ActiveRecord::Migration
  def change
    add_column :items, :factura_id, :integer
  end
end
