module V1
    class Procedures < Grape::API
      resource :procedures do
        desc 'Get all Procedures'
        get do
          present Procedure.all, with: Entities::Procedure
        end
  
        desc 'Create new procedure'
        params do
          requires :patient_rut, type: String, desc: 'Patient rut from a movement'
          requires :professional_rut, type: String, desc: 'Professional rut from a movement'
        end
        post do
          procedure = Procedure.new
          return nil if (procedure.consult! params[:patient_rut], params[:professional_rut]) == nil
          procedure.save!
          procedure
        end
      end
    end
  end