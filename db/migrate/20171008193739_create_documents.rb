class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.references :movement
      t.integer :doc_id, null: false
      t.timestamps
    end
  end
end
