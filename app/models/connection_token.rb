class ConnectionToken < ApplicationRecord
  belongs_to :medical_center

  validates :medical_center_id, :driver, presence: true
  def self.create_from_params(params)
    attributes = params.to_h.symbolize_keys
    entry = new
    entry.medical_center_id = attributes[:medical_center_id]
    entry.driver = attributes[:driver]
    entry.active = attributes[:active] || true
    entry.token = attributes[:token]
    entry
  end

  def self.find_by_id(id)
    find_by(id: id)
  end

  def self.find_by_token(token)
    find_by(token: token)
  end
end
