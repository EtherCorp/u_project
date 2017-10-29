class Patient < ApplicationRecord
  has_many :consults
  has_many :permissions

  validates :rut, :name, :last_name, :age, presence: true

  def self.create_from_params(params)
    attributes = params.to_h.symbolize_keys
    patient = new
    patient.rut = attributes[:rut]
    patient.name = attributes[:name]
    patient.last_name = attributes[:last_name]
    patient.age = attributes[:age]
    patient
  end

  def self.find_by_id(id)
    find_by(id: id)
  end
end
