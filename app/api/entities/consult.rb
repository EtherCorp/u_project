module Entities
  class Consult < Grape::Entity
    expose :id
    expose :patient, using: Entities::Patient
    expose :professional, using: Entities::Professional
    expose :date
    expose :reason
    expose :symptoms
    expose :observations
    expose :movements, using: Entities::Movement
  end
end