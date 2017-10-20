module Entities
  class Movement < Grape::Entity
    expose :id
    expose :consult_id
    expose :movement_type, using: Entities::MovementType
    expose :movement_details, using: Entities::MovementDetail
    expose :documents, using: Entities::Document
  end
end
