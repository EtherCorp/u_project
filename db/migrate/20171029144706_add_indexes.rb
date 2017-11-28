class AddIndexes < ActiveRecord::Migration[5.1]
  def change
    add_index :patients, :rut, unique: true
    add_index :professionals, :rut, unique: true
    add_index :specialities, :name, unique: true
  end
end
