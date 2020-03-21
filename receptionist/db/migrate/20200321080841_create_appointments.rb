class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.datetime :datetime
      t.string :status
      t.string :classification
      t.text :remarks

      t.timestamps
    end
  end
end