class CreateProfessionals < ActiveRecord::Migration[5.1]
  def change
    create_table :professionals do |t|
      t.string :rut, null: false
      t.string :name, null: false
      t.string :last_name, null: false
      t.integer :age, null: false
      t.string :nationality, null: false
      t.string :job_title, null: false
      t.date :grant_date, null: false
      t.string :granting_entity, null: false
      t.references :speciality
      t.string :registration_number, null: false
      t.date :registration_date, null: false
      t.boolean :freelance, default: false
      t.string :email, null: false
      t.string :phone
      t.timestamps
    end
  end
end
