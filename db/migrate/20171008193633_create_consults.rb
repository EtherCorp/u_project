class CreateConsults < ActiveRecord::Migration[5.1]
  def change
    create_table :consults do |t|
      t.references :patient
      t.references :professional
      t.date :date, null: false
      t.string :reason
      t.string :symptoms
      t.string :observations
      t.timestamps
    end
  end
end
