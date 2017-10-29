module V1
  class Patients < Grape::API
    resource :patients do
      desc 'Get all patients'
      get do
        present Patient.all, with: Entities::Patient
      end

      desc 'Create new patient'
      params do
        requires :rut, type: String, desc: 'RUT'
        requires :name, type: String, desc: 'Name'
        requires :last_name, type: String, desc: 'Last name'
        requires :age, type: Integer, desc: 'Age'
      end
      post do
        patient = Patient.create_from_params params
        error! 'Unprocessable Entity', 422 unless patient.save
        patient
      end

      route_param :id do
        desc 'Get patient by ID'
        get do
          patient = Patient.find_by_id(params[:id])
          error! 'Not Found', 404 unless patient
          present patient, with: Entities::Patient
        end

        resource :consults do
          desc 'Get all consults from a patient'
          get do
            patient = Patient.find_by_id(params[:id])
            error! 'Not Found', 404 unless patient
            present patient.consults, with: Entities::Consult
          end
        end

        # Get Movements
        resource :exams do
          desc 'Get all exams of a patient'
          get do
            patient = Patient.find_by_id(params[:id])
            error! 'Not Found', 404 unless patient
            present patient.movements_by_type(:exam), with: Entities::Movement
          end
        end
        resource :licenses do
          desc 'Get all licenses of a patient'
          get do
            patient = Patient.find_by_id(params[:id])
            error! 'Not Found', 404 unless patient
            present patient.movements_by_type(:license), with: Entities::Movement
          end
        end
        resource :prescriptions do
          desc 'Get all prescriptions of a patient'
          get do
            patient = Patient.find_by_id(params[:id])
            error! 'Not Found', 404 unless patient
            present patient.movements_by_type(:prescription), with: Entities::Movement
          end
        end
        resource :procedures do
          desc 'Get all procedures of a patient'
          get do
            patient = Patient.find_by_id(params[:id])
            error! 'Not Found', 404 unless patient
            present patient.movements_by_type(:procedure), with: Entities::Movement
          end
        end
      end
    end
  end
end
