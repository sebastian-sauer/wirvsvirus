class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.datetime :datetime
      t.integer :appointmentstatus
      t.integer :classification
      t.text :remarks
      t.integer :sortOrder
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
