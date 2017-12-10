require 'google/apis/drive_v3'
require 'googleauth'
require 'googleauth/stores/file_token_store'
module Services
  class GoogleDrive < Storage::Storage
    OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'.freeze
    APPLICATION_NAME = 'Unicorn'.freeze
    CLIENT_SECRETS_PATH = 'config/storage/google_drive.json'.freeze
    CREDENTIALS_PATH = File.join(Dir.home, '.credentials',
                                 'drive-ruby-quickstart.yaml')
    SCOPE = 'https://www.googleapis.com/auth/drive.file'.freeze

    def authorize
      FileUtils.mkdir_p(File.dirname(CREDENTIALS_PATH))

      client_id = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
      token_store = Google::Auth::Stores::FileTokenStore.new(file: CREDENTIALS_PATH)
      authorizer = Google::Auth::UserAuthorizer.new(client_id, SCOPE, token_store)
      user_id = 'default'
      credentials = authorizer.get_credentials(user_id)

      if credentials.nil?
        url = authorizer.get_authorization_url(
            base_url: OOB_URI)
        puts 'Open the following URL in the browser and enter the ' \
                 'resulting code after authorization'
        puts url
        code = gets
        credentials = authorizer.get_and_store_credentials_from_code(user_id: user_id,
                                                                     code: code,
                                                                     base_url: OOB_URI)
      end

      credentials
    end

    def upload_file(file_name, authorize = self.authorize)
      service = Google::Apis::DriveV3::DriveService.new
      service.client_options.application_name = APPLICATION_NAME
      service.authorization = authorize


      file_path = FILES_PATH + file_name
      mime = MIME::Types.type_for(file_path)[0].to_s

      file_metadata = {
          name: file_name,
          mime_type: mime
      }

      file = service.create_file(file_metadata,
                                 fields: 'id',
                                 upload_source: file_path,
                                 content_type: mime)
      file.id
    end

    def read_file(file_data)
      service = Google::Apis::DriveV3::DriveService.new
      service.client_options.application_name = APPLICATION_NAME
      service.authorization = authorize
      service.get_file(file_data[:id], download_dest: FILES_PATH + file_data[:name])
    end
  end
end