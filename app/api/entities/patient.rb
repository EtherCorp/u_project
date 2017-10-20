module Entities
  class Patient < Grape::Entity
    expose :id
    expose :name
    expose :last_name
    expose :age
  end
end