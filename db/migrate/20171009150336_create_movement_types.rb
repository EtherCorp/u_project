class CreateMovementTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :movement_types do |t|
      t.string :name, null: false
      t.timestamps
    end
    add_index :movement_types, :name, unique: true
  end
end
