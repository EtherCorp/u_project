class Patient < ApplicationRecord
  has_many :consults
  has_many :permissions

  validates :rut, :name, :last_name, :age, presence: true

  def self.create_from_params(params)
    return unless params
    attributes = params.to_h.symbolize_keys
    patient = new
    patient.rut = attributes[:rut]
    patient.password = attributes[:password]
    patient.name = attributes[:name]
    patient.last_name = attributes[:last_name]
    patient.age = attributes[:age]
    patient
  end

  def self.find_by_id(id)
    find_by(id: id)
  end

  def movements_by_type(movement_type)
    multi_level_result = consults.collect do |consult|
      consult.movements.select { |movement| movement.type == movement_type}
    end
    multi_level_result.flatten
  end
end
