class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nombre
      t.text :direccion
      t.string :ciudad
      t.text :giro
      t.string :rut

      t.timestamps
    end
  end
end
