class RemoveExpirationFromConnectionTokens < ActiveRecord::Migration[5.1]
  def change
    remove_column :connection_tokens, :expiration, :date
  end
end
