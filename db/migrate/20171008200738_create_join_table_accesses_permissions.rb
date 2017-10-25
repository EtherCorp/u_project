class CreateJoinTableAccessesPermissions < ActiveRecord::Migration[5.1]
  def change
    create_join_table :accesses, :permissions do |t|
      t.index :access_id
      t.index :permission_id
    end
  end
end
