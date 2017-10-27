class CreateMovementTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :movement_types do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
