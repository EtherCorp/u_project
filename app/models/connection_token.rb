class ConnectionToken < ApplicationRecord
  belongs_to :medical_center

  validates :medical_center_id, :driver, presence: true
  def self.create_from_params(params)
    attributes = params.to_h.symbolize_keys
    entry = new
    entry.medical_center_id = attributes[:medical_center_id]
    entry.driver = attributes[:driver]
    entry
  end
end
