require_dependency("lib/storage/services/google_drive")
class Movement < ApplicationRecord
  belongs_to :consult
  has_many :documents
  has_many :movement_details

  validates :consult_id, presence: true

  def self.create_from_params(params)
    attributes = params.to_h.symbolize_keys
    entry = new
    entry.consult_id = attributes[:consult_id]
    entry.movement_type = attributes[:type] || 'unknown'
    attributes[:details].each do |detail|
      mov_detail = MovementDetail.create_from_params detail
      mov_detail.save
      entry.movement_details << mov_detail

      if detail[:key] == 'file'
        Storage::Storage.store! detail[:value], Services::GoogleDrive.new
      end
    end
    entry
  end

  def self.find_by_id(id)
    find_by(id: id)
  end

  def self.find_by_type(movement_type)
    find_by(type: movement_type)
  end
end
