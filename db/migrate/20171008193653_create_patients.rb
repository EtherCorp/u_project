class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :rut, null: false
      t.string :name, null: false
      t.string :last_name, null: false
      t.integer :age, null: false
      t.timestamps
    end
  end
end
