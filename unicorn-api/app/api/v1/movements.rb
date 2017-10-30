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
      end
      post do
        movement = Movement.new params
        movement.save!
        movement
      end
    end
  end
end

