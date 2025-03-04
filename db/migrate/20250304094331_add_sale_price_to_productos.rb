class AddSalePriceToProductos < ActiveRecord::Migration[8.0]
  def change
    add_column :productos, :sale_price, :decimal
  end
end
