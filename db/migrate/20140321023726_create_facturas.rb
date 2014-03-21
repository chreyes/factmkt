class CreateFacturas < ActiveRecord::Migration
  def change
    create_table :facturas do |t|
      t.date :fecha

      t.timestamps
    end
  end
end
