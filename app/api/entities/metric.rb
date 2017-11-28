module Entities
  class Metric < Grape::Entity
    expose :id
    expose :name
    expose :measurements, using: Entities::Measurement
  end
end