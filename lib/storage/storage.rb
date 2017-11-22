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
  end
end
