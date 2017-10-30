class Speciality < ApplicationRecord
  has_many :professionals

  validates :name, presence: true

  def self.create_from_params params
    attributes = params.to_h.symbolize_keys
    entry = new
    entry.name = attributes[:name]
    entry
  end
end
