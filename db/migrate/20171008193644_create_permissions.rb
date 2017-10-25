class CreatePermissions < ActiveRecord::Migration[5.1]
  def change
    create_table :permissions do |t|
      t.references :patient
      t.references :professional
      t.date :date, null: false
      t.date :expiration, null: false
      t.timestamps
    end
  end
end
