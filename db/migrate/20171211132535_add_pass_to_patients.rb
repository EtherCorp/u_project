class AddPassToPatients < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :password, :string, null: true
  end
end
