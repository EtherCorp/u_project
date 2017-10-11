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
        patient = Patient.new params
        patient.save!
        patient
      end

      route_param :id do
        desc 'Get patient by ID'
        get do
          present Patient.find_by(id: params[:id]), with: Entities::Patient
        end

        resource :consults do
          desc 'Get all consults from a patient'
          get do
            present Patient.find_by(id: params[:id]).consults,
                    with: Entities::Consult
          end
        end
      end
    end
  end
end
