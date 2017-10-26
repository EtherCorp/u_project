module V1
    class Licenses < Grape::API
      resource :licenses do
        desc 'Get all Licenses'
        get do
          present License.all, with: Entities::License
        end
  
        desc 'Create new license'
        params do
          requires :patient_rut, type: String, desc: 'Patient rut from a movement'
          requires :professional_rut, type: String, desc: 'Professional rut from a movement'
        end
        post do
          license = License.new
          return nil if (license.consult! params[:patient_rut], params[:professional_rut]) == nil
          license.save!
          license
        end
      end
    end
  end