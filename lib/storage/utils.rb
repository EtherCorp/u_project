require 'fileutils'
require 'base64'
module Storage
  class Utils
    def self.encode_file(filename)
      file = File.open(Storage::FILES_PATH + filename, 'rb')
      encoded = Base64.encode64(file.read)
      file.close
      encoded
    end

    def self.decode_file(filename)
      file = File.open(Storage::FILES_PATH + filename, 'rb')
      content = file.read
      file.close
      Base64.decode64(content)
    end

    def self.write_file(filename, content)
      file = File.open(Storage::FILES_PATH + filename, 'wb')
      decoded_content = Base64.decode64(content)
      file.puts(decoded_content)
      file.close
      nil
    end
  end
end