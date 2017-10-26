require 'google/apis/drive_v3'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'fileutils'

module Storage
    OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'
    APPLICATION_NAME = 'My project'
    CLIENT_SECRETS_PATH = 'client_secret.json'
    CREDENTIALS_PATH = File.join(Dir.home, '.credentials',
                                    "drive-ruby-quickstart.yaml")
    SCOPE = 'https://www.googleapis.com/auth/drive.file'

    ##
    # Ensure valid credentials, either by restoring from the saved credentials
    # files or intitiating an OAuth2 authorization. If authorization is required,
    # the user's default browser will be launched to approve the request.
    #
    # @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials
    def authorize
        FileUtils.mkdir_p(File.dirname(CREDENTIALS_PATH))

        client_id = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
        token_store = Google::Auth::Stores::FileTokenStore.new(file: CREDENTIALS_PATH)
        authorizer = Google::Auth::UserAuthorizer.new(
        client_id, SCOPE, token_store)
        user_id = 'default'
        credentials = authorizer.get_credentials(user_id)
        if credentials.nil?
        url = authorizer.get_authorization_url(
            base_url: OOB_URI)
        puts "Open the following URL in the browser and enter the " +
                "resulting code after authorization"
        puts url
        code = gets
        credentials = authorizer.get_and_store_credentials_from_code(
            user_id: user_id, code: code, base_url: OOB_URI)
        end
        credentials
    end

    # Initialize the API
    def read(authorize)
        service = Google::Apis::DriveV3::DriveService.new
        service.client_options.application_name = APPLICATION_NAME
        service.authorization = authorize

        response = service.list_files(page_size: 10,
        fields: 'nextPageToken, files(id, name)')
        puts 'Files:'
        puts 'No files found' if response.files.empty?
        response.files.each do |file|
        puts "#{file.name} (#{file.id})"
        end
    end
    def upload(authorize, nameFile, nameOnDrive)
        
        service = Google::Apis::DriveV3::DriveService.new
        service.client_options.application_name = APPLICATION_NAME
        service.authorization = authorize
        
        # SUBIR
        file_metadata = {
          name: nameOnDrive,
          mime_type: 'application/json'
        }
        
        file = service.create_file(file_metadata,
                                    fields: 'id',
                                    upload_source: nameFile + '.json',
                                    content_type: 'application/json')
        puts "File Id: #{file.id}"
        
    end
end

class  Test
    include Storage
    def initialize
        newName = 'archivo nuevo'
        namFile = 'client_secret'
        read(authorize)
        upload(authorize, namFile , newName)
    end
end

Test.new
