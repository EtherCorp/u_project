class Movement < ApplicationRecord
  belongs_to :consult
  has_many :documents
  has_many :movement_details

  def consult!(patient_rut, professional_rut)
    patient = Patient.find_by rut: patient_rut
    professional = Professional.find_by rut: professional_rut
    return nil if (patient || professional) == nil
    consult = Consult.new patient: patient, professional: professional, date: Time.now
    consult.save!
    self.consult = consult
  end
end
