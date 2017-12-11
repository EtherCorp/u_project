class AddPassToProfessionals < ActiveRecord::Migration[5.1]
  def change
    add_column :professionals, :password, :string, null: true
  end
end
