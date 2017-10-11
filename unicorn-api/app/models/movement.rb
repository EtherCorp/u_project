class Movement < ApplicationRecord
  belongs_to :consults, optional: true
  has_many :documents
  has_many :movement_details
  belongs_to :movement_type, optional: true
end
