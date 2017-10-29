class MovementDetail < ApplicationRecord
  belongs_to :movement

  validate :movement_id, presence: true


end
