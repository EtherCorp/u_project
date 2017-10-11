class Professional < ApplicationRecord
  has_many :consults
  has_and_belongs_to_many :medical_centers
  has_many :permissions
  belongs_to :specialities, optional: true
end
