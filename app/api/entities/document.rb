module Entities
  class Document < Grape::Entity
    expose :id
    expose :movement_id
    expose :doc_id
  end
end