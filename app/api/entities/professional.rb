module Entities
  class Professional < Grape::Entity
    expose :id
    expose :name
    expose :last_name
    expose :rut
    expose :age
    expose :nationality
    expose :speciality, using: Entities::Speciality
    expose :registration_date
    expose :freelance
    expose :job_title
    expose :grant_date
    expose :granting_entity
  end
end
