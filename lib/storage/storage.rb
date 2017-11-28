require 'securerandom'
require 'fileutils'
module Storage
  class Storage
    FILES_PATH = 'tmp/files/'.freeze

    def authorize
      raise 'Not implemented'
    end

    def upload_file(file_name)
      raise 'Not implemented'
    end

    def read_file(file_name)
      raise 'Not implemented'
    end

    def self.store!(content, service)
      name = SecureRandom.hex(16)
      Utils.write_file name, content
      service.upload_file name
      FileUtils.rm FILES_PATH + name
    end
  end
end
