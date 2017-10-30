module V1
    class Procedures < Grape::API
      resource :procedures do
        desc 'Get all Procedures'
        get do
          present Procedure.all, with: Entities::Procedure
        end
  
        desc 'Create new procedure'
        params do
          requires :consult_id, type: Integer, desc: 'Consult asociated to movement'
        end
        post do
          proc = Procedure.new params
          proc.save!
          proc
        end
      end
    end
  end