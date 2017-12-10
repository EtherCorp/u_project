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

    def read_file(file_data)
      raise 'Not implemented'
    end

    def self.store(file, service)
      file_name = SecureRandom.hex(8) + '_' + file[:name]
      Utils.write_file file_name, file[:content]
      file_id = service.upload_file file_name
      FileUtils.rm FILES_PATH + file_name
      Hash[id: file_id, name: file_name]
    end

    def self.download(file_data, service)
      service.read_file file_data
      name = URI.escape(file_data[:name])
      file_path = FILES_PATH + name
      mime = MIME::Types.type_for(file_path)[0].to_s
      data = File.binread file_path
      FileUtils.rm file_path
      Hash[name: name, mime: mime, data: data]
    end
  end
end
