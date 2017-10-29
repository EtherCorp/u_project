class Consult < ApplicationRecord
  has_many :movements
  belongs_to :patient
  belongs_to :professional

  validates :patient_id, :professional_id, presence: true

  def self.create_from_params(params)
    attributes = params.to_h.symbolize_keys
    consult = new
    consult.patient_id = attributes[:patient_id]
    consult.professional_id = attributes[:professional_id]
    consult.date = attributes[:date] || DateTime.now
    consult.reason = attributes[:reason] || ''
    consult.symptoms = attributes[:symptoms] || ''
    consult.observations = attributes[:observations]
    consult
  end

  def self.find_by_id(id)
    find_by(id: id)
  end
end
