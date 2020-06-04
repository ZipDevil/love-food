class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.string :appointment_type
      t.datetime :appointment_time
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
