module V1
    class Prescriptions < Grape::API
      resource :prescriptions do
        desc 'Get all Prescriptions'
        get do
          present Prescription.all, with: Entities::Prescription
        end
  
        desc 'Create new prescription'
        params do
          requires :patient_rut, type: String, desc: 'Patient rut from a movement'
          requires :professional_rut, type: String, desc: 'Professional rut from a movement'
        end
        post do
          prescription = Prescription.new
          return nil if (prescription.consult! params[:patient_rut], params[:professional_rut]) == nil
          prescription.save!
          prescription
        end
      end
    end
  end