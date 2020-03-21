class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.date :birthday
      t.string :name
      t.integer :timeToDoc
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
