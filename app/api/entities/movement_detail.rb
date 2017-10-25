module Entities
  class MovementDetail < Grape::Entity
    expose :id
    expose :movement_id
    expose :key
    expose :value
  end
end
