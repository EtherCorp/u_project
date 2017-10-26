module V1
    class Diagnostics < Grape::API
      resource :diagnostics do
        desc 'Get all Diagnostics'
        get do
          present Diagnostic.all, with: Entities::Diagnostic
        end
  
        desc 'Create new diagnostic'
        params do
          requires :patient_rut, type: String, desc: 'Patient rut from a movement'
          requires :professional_rut, type: String, desc: 'Professional rut from a movement'
        end
        post do
          diagnostic = Diagnostic.new
          return nil if (diagnostic.consult! params[:patient_rut], params[:professional_rut]) == nil
          diagnostic.save!
          diagnostic
        end
      end
    end
  end