module V1
  class ConnectionTokens < Grape::API
    resource :connection_tokens do
      desc 'Get all connection tokens'
      get do
        present ConnectionToken.all, with: Entities::ConnectionToken
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

      route_param :id do
        desc 'Get connection token by ID'
        get do
          token = ConnectionToken.find_by_id(params[:id])
          error! 'Not Found', 404 unless token
          present token, with: Entities::ConnectionToken
        end
      end
    end
  end
end
