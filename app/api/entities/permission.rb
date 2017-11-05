module Entities
  class Permission < Grape::Entity
    expose :id
    expose :date
    expose :expiration
    expose :accesses, using: Entities::Access
  end
end