module Entities
  class Measurement < Grape::Entity
    expose :id
    expose :value
  end
end