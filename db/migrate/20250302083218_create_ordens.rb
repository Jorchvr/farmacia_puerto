class CreateOrdens < ActiveRecord::Migration[8.0]
  def change
    create_table :ordens do |t|
      t.decimal :total

      t.timestamps
    end
  end
end
