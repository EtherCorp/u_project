module V1
  class MovementTypes < Grape::API
    resource :movement_types do
      desc 'Get all movement types'
      get do
        present MovementType.all, with: Entities::MovementType
      end

      desc 'Create new movement type'
      params do
        requires :name, type: String, desc: 'Movement type name'
      end
      post do
        mov_type = MovementType.new params
        mov_type.save!
        mov_type
      end
    end
  end
end

