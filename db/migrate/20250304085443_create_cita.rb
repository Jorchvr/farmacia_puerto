class CreateCita < ActiveRecord::Migration[8.0]
  def change
    create_table :cita do |t|
      t.string :patient_name
      t.text :reason
      t.string :email
      t.date :appointment_date

      t.timestamps
    end
  end
end
