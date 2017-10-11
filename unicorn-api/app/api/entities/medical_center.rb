module Entities
  class MedicalCenter < Grape::Entity
    expose :id
    expose :name
    expose :address
  end
end