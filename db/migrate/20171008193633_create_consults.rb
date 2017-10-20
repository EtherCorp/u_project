class CreateConsults < ActiveRecord::Migration[5.1]
  def change
    create_table :consults do |t|
      t.references :patient
      t.references :professional
      t.date :date, null: false
      t.string :reason, null: false
      t.string :symptoms, null: false
      t.string :observations
      t.timestamps
    end
  end
end
