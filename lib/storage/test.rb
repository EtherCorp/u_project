require_dependency("lib/storage/services/google_drive")
module Storage
  class Test
    def initialize
      encoded = Utils.encode_file 'tmp/files/ahms.png'
      Utils.write_file 'tmp/files/ahms_encoded', encoded
      drive = Services::GoogleDrive.new
      drive.upload_file 'ahms_encoded'
    end
  end
end