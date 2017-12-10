require 'fileutils'
module V1
  class Movements < Grape::API
    resource :movements do
      desc 'Get all movements'
      get do
        present Movement.all, with: Entities::Movement
      end

      desc 'Create new movement type'
      params do
        requires :consult_id, type: Integer, desc: 'Consult asociated to movement'
        optional :type, type: String, desc: 'Type of movement'
        optional :details, type: Array, desc: 'Array of hashes, details'
      end
      post do
        movement = Movement.create_from_params params
        error! 'Unprocessable Entity', 422 unless movement.save
        movement
      end

      route_param :id do
        desc 'Get movement by ID'
        get do
          movement = Movement.find_by_id(params[:id])
          error! 'Not Found', 404 unless movement
          present movement, with: Entities::Movement
        end
      end
    end
  end
end

