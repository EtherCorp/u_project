class CreateMovementDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :movement_details do |t|
      t.references :movement
      t.string :key, null: false
      t.string :value, null: false
      t.timestamps
    end
  end
end
