class AddDetailsToConnectionTokens < ActiveRecord::Migration[5.1]
  def change
    change_column_null :connection_tokens, :token, true
    add_column :connection_tokens, :active, :boolean, null: false, default: true
    add_column :connection_tokens, :driver, :string, null: false
  end
end
