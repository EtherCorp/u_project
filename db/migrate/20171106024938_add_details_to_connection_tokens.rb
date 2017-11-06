class AddDetailsToConnectionTokens < ActiveRecord::Migration[5.1]
  def change
    add_column :connection_tokens, :active, :boolean, null: false
    add_column :connection_tokens, :driver, :string, null: false
  end
end
