class Permission < ApplicationRecord
  has_and_belongs_to_many :accesses
  belongs_to :patient
  belongs_to :professional
  validates :patient_id, :professional_id, :date, :expiration, presence: true

  def self.create_from_params(params)
    attributes = params.to_h.symbolize_keys
    permission = new
    permission.patient_id = attributes[:patient_id]
    permission.professional_id = attributes[:professional_id]
    permission.date = attributes[:date]
    permission.expiration = attributes[:expiration]
    permission
  end

  def self.find_by_id(id)
    find_by(id: id)
  end

  def self.create_permission_token(patient_id)
    patient = Patient.find_by_id(patient_id)
    #error! 'Patient Not Found', 404 unless patient
    SecureRandom.hex(3)
  end

  def self.find_by_patient_id_and_professional_id(patient_id, professional_id)
    find_by(patient_id: patient_id, professional_id: professional_id)
  end
end
