class AddHelperToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :helper, :boolean
  end
end
