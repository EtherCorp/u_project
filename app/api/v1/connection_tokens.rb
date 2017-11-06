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
        requires :token, type: String, desc: 'Metric name'
        requires :expiration, type: Date, desc: 'Expiration date'
      end
      post do
        token = ConnectionToken.create_from_params params
        error! 'Unprocessable Entity', 422 unless token.save
        token
      end

      route_param :id do
        desc 'Get connection token by ID'
        get do
          token = Metric.find_by_id(params[:id])
          error! 'Not Found', 404 unless token
          present token, with: Entities::ConnectionToken
        end
      end
    end
  end
end