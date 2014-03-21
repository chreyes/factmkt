class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :cantidad
      t.text :detalle
      t.integer :precio

      t.timestamps
    end
  end
end
