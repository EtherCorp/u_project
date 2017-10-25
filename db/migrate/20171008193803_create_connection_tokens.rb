class CreateConnectionTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :connection_tokens do |t|
      t.references :medical_center
      t.string :token, null: false
      t.date :expiration, null: false
      t.timestamps
    end
  end
end
