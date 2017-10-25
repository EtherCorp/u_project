class CreateJoinTableMedicalCentersProfessionals < ActiveRecord::Migration[5.1]
  def change
    create_join_table :medical_centers, :professionals do |t|
      t.index :medical_center_id
      t.index :professional_id
    end
  end
end
