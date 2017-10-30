module V1
    class Prescriptions < Grape::API
      resource :prescriptions do
        desc 'Get all Prescriptions'
        get do
          present Prescription.all, with: Entities::Prescription
        end
  
        desc 'Create new prescription'
        params do
          requires :consult_id, type: Integer, desc: 'Consult asociated to movement'
        end
        post do
          presc = Prescription.new params
          presc.save!
          presc
        end
      end
    end
  end