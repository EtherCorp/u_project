module V1
  class ConnectionTokens < Grape::API
    resource :connection_tokens do
      desc 'Get all connection tokens'
      get do
        present ConnectionToken.all, with: Entities::ConnectionToken
      end

      desc 'Get connection token if is valid'
      get 'token' do
        error! 'No Token Provided' unless headers['Medical-Center-Token']

        decoded_token = JsonWebToken::JsonWebToken.decode(headers['Medical-Center-Token'])
        error! 'Invalid token' unless decoded_token

        token = ConnectionToken.find_by_id(decoded_token[0]['token_id'])
        error! 'Not Found', 404 unless token
        error! 'Token not active' unless token.active
        token
      end

      desc 'Create new connection token'
      params do
        requires :medical_center_id, type: Integer, desc: 'Medical center ID'
        requires :active, type: Boolean, desc: 'Status token'
        requires :driver, type: String, desc: 'Driver medical center'
      end
      post do
        token = ConnectionToken.create_from_params params
        error! 'Unprocessable Entity', 422 unless token.save
        payload = { token_id: token.id }
        token.token = JsonWebToken::JsonWebToken.encode(payload)
        token.save
        token
      end
    end
  end
end