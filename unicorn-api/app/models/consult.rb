class Consult < ApplicationRecord
  has_many :movements
  belongs_to :patient
  belongs_to :professional
end
