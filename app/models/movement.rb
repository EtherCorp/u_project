class Movement < ApplicationRecord
  belongs_to :consult
  has_many :documents
  has_many :movement_details

  validates :consult_id, presence: true

  def self.create_from_params(params)
    attributes = params.to_h.symbolize_keys
    entry = new
    entry.consult_id = attributes[:consult_id]
    entry.type = attributes[:type] || 'unknown'
    entry
  end

  def self.find_by_id(id)
    find_by(id: id)
  end

  def self.find_by_type(movement_type)
    find_by(type: movement_type)
  end
end
