module Entities
  class ConnectionToken < Grape::Entity
    expose :id
    expose :token
    expose :expiration
    expose :medical_center, using: Entities::MedicalCenter
  end
end