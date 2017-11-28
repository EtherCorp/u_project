class MedicalCenter < ApplicationRecord
  has_and_belongs_to_many :professionals
  has_many :connection_tokens

  validates :name, :address, presence: true

  def self.create_from_params(params)
    attributes = params.to_h.symbolize_keys
    entry = new
    entry.name = attributes[:name]
    entry.address = attributes[:address]
    entry
  end

  def itself.find_by_id(id)
    find_by(id: id)
  end
end
