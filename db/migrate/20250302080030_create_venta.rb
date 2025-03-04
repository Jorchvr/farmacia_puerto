class CreateVenta < ActiveRecord::Migration[8.0]
  def change
    create_table :venta do |t|
      t.references :producto, null: false, foreign_key: true
      t.integer :cantidad
      t.decimal :total
      t.date :fecha

      t.timestamps
    end
  end
end
