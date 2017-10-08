class Movement < ApplicationRecord
  belongs_to :consults
  has_many :documents
  has_many :movement_details
end
