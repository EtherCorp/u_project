class CreateMeasurements < ActiveRecord::Migration[5.1]
  def change
    create_table :measurements do |t|
      t.references :metric
      t.string :value, null: false
      t.timestamps
    end
  end
end
