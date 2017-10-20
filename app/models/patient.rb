class Patient < ApplicationRecord
  has_many :consults
  has_many :permissions
end
