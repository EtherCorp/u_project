class Permission < ApplicationRecord
  has_and_belongs_to_many :accesses
  belongs_to :patients
  belongs_to :professionals
end
