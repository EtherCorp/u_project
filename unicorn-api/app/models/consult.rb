class Consult < ApplicationRecord
  has_many :movements
  belongs_to :patients, optional: true
  belongs_to :professionals, optional: true
end
