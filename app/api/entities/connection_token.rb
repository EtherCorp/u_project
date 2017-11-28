module Entities
  class ConnectionToken < Grape::Entity
    expose :id
    expose :token
    expose :active
    expose :driver
    expose :medical_center, using: Entities::MedicalCenter
  end
end