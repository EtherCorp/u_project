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
      JWT.decode(token,
                 auth_secret,
                 true,
                 algorithm: ALGORITHM)
    end

    def self.auth_secret
      Rails.application.secrets.secret_key_base
    end
  end
end
