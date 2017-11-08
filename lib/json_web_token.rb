require 'jwt'
module JsonWebToken
  class JsonWebToken
    ALGORITHM = 'HS256'.freeze
    def self.encode(payload)
      JWT.encode(
        payload,
        auth_secret,
        ALGORITHM
      )
    end

    def self.decode(token)
      begin
        response = JWT.decode(token,
                             auth_secret,
                             true,
                             algorithm: ALGORITHM)
      rescue
        response = nil
      end
      response
    end

    def self.auth_secret
      Rails.application.secrets.secret_key_base
    end
  end
end
