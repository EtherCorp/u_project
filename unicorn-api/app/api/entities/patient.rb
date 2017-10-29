module Entities
  class Patient < Grape::Entity
    expose :id
    expose :rut
    expose :name
    expose :last_name
    expose :age
  end
end