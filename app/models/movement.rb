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

    mov_details = store_details(attributes[:details])
    entry.movement_details << mov_details

    mov_files = store_files(attributes[:files])
    entry.movement_details << mov_files
    entry
  end

  def self.store_details(details)
    return [] unless details
    mov_details = []
    details.each do |detail|
      mov_detail = MovementDetail.create_from_params detail
      mov_detail.save
      mov_details << mov_detail
    end
    mov_details
  end

  def self.store_files(files)
    return [] unless files
    mov_files = []
    service = Services::GoogleDrive.new
    files.each do |file|
      file_data = Storage::Storage.store file, service
      params = Hash[key: 'file', value: file_data.to_s]
      mov_file = MovementDetail.create_from_params params
      mov_file.save
      mov_files << mov_file
    end
    mov_files
  end

  def self.find_by_id(id)
    find_by(id: id)
  end

  def self.find_by_type(movement_type)
    find_by(type: movement_type)
  end
end
