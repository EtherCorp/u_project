module V1
  class Consults < Grape::API
    resource :consults do
      desc 'Get all consults'
      get do
        present Consult.all, with: Entities::Consult
      end

      desc 'Create new consult'
      params do
        requires :patient_id, type: Integer, desc: 'Patient ID'
        requires :professional_id, type: Integer, desc: 'Professional ID'
        requires :reason, type: String, desc: 'Consult reason'
        requires :symptoms, type: String, desc: 'Symptoms'
        optional :date, type: DateTime, desc: 'Consult date'
        optional :observations, type: String, desc: 'Observations'
      end
      post do
        consult = Consult.create_from_params params
        error! 'Unprocessable Entity', 422 unless consult.save
        consult
      end

      route_param :consult_id do
        desc 'Get consult by ID'
        get do
          consult = Consult.find_by_id(params[:consult_id])
          error! 'Not Found', 404 unless consult
          present consult, with: Entities::Consult
        end

        resource :movements do
          desc 'Get all movements from a consult'
          get do
            consult = Consult.find_by(id: params[:consult_id])
            error! 'Not Found', 404 unless consult
            present consult.movements, with: Entities::Movement
          end
        end
      end
    end
  end
end


