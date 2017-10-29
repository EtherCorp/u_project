class Movement < ApplicationRecord
  belongs_to :consult
  has_many :documents
  has_many :movement_details
  belongs_to :movement_type

  validates :consult_id, :movement_type_id, presence: true

  def self.create_from_params(params)
    attributes = params.to_h.symbolize_keys
    movement = new
    movement.consult_id = attributes[:consult_id]
    movement.movement_type_id = attributes[:movement_type_id]
    movement
  end
end
