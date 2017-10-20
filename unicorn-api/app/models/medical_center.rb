class MedicalCenter < ApplicationRecord
  has_and_belongs_to_many :professionals
  has_many :connection_tokens
end
