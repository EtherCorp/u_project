class CreateMovements < ActiveRecord::Migration[5.1]
  def change
    create_table :movements do |t|
      t.references :consult
      t.string :type
      t.timestamps
    end
  end
end
