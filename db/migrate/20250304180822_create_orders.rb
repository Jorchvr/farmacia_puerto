class CreateOrdenes < ActiveRecord::Migration[6.1]
  def change
    create_table :ordenes do |t|
      t.string :payment_method
      t.decimal :total, precision: 10, scale: 2
      t.date :sale_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
