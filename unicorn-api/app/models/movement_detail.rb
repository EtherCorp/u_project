class MovementDetail < ApplicationRecord
  belongs_to :movements, optional: true
end
