class Consult < ApplicationRecord
  has_many :movements
  belongs_to :patients
  belongs_to :professionals
end
