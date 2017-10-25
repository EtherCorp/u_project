class Movement < ApplicationRecord
  belongs_to :consult
  has_many :documents
  has_many :movement_details
end
