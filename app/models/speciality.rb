class Speciality < ApplicationRecord
  has_many :professionals

  validates :name, presence: true

  def self.create_from_params params

  end
end
