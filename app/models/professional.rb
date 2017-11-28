class Professional < ApplicationRecord
  has_many :consults
  has_and_belongs_to_many :medical_centers
  has_many :permissions
  belongs_to :speciality

  validates :rut,
            :name,
            :last_name,
            :age,
            :nationality,
            :speciality_id,
            :registration_number,
            :registration_date,
            :job_title,
            :grant_date,
            :granting_entity,
            :email,
            presence: true
  validates :freelance, inclusion: { in: [true, false] }


  def self.create_from_params(params)
    attributes = params.to_h.symbolize_keys
    entry = new
    entry.rut = attributes[:rut]
    entry.name = attributes[:name]
    entry.last_name = attributes[:last_name]
    entry.age = attributes[:age]
    entry.nationality = attributes[:nationality]
    entry.speciality_id = attributes[:speciality_id]
    entry.registration_number = attributes[:registration_number]
    entry.registration_date = attributes[:registration_date]
    entry.job_title = attributes[:job_title]
    entry.grant_date = attributes[:grant_date]
    entry.granting_entity = attributes[:granting_entity]
    entry.email = attributes[:email]
    entry.freelance = attributes[:freelance]

    # optionals
    entry.phone = attributes[:phone]

    entry
  end

  def self.find_by_id(id)
    find_by(id: id)
  end

  def self.find_by_rut(rut)
    find_by(rut: rut)
  end
end
