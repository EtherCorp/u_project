class Permission < ApplicationRecord
  has_and_belongs_to_many :accesses
  belongs_to :patient
  belongs_to :professional
end
