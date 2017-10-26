module Entities
  class Patient < Grape::Entity
    expose :id
    expose :name
    expose :last_name
    expose :rut
    expose :age
  end
end