module V1
  class Professionals < Grape::API
    resource :professionals do
      desc 'Get all professionals'
      get do
        present Professional.all, with: Entities::Professional
      end

      desc 'Create new professional'
      params do
        requires :rut, type: String, desc: 'RUT'
        requires :name, type: String, desc: 'Name'
        requires :last_name, type: String, desc: 'Last name'
        requires :age, type: Integer, desc: 'Age'
        requires :nationality, type: String, desc: 'Nationality'
        requires :speciality_id, type: Integer, desc: 'Speciality ID'
        requires :registration_number, type: String, desc: 'Registration number'
        requires :registration_date, type: Date, desc: 'Registration date'
        requires :job_title, type: String, desc: 'Job title'
        requires :grant_date, type: Date, desc: 'Grant date'
        requires :granting_entity, type: String, desc: 'Granting entity name'
        requires :email, type: String, desc: 'E-mail'
        optional :phone, type: String, desc: 'Phone'
        requires :freelance, type: Boolean, desc: 'Is freelance'
      end
      post do
        professional = Professional.new params
        professional.save!
        professional
      end

      route_param :id do
        desc 'Get professional by ID'
        get do
          present Professional.find_by(id: params[:id]),
                  with: Entities::Professional
        end

        resource :consults do
          desc 'Get all consults from a professional'
          get do
            present Professional.find_by(id: params[:id]).consults, with: Entities::Consult
          end
        end

        resource :medical_centers do
          desc 'Get medical center(s) where a specified professional works'
          get do
            present Professional.find_by(id: params[:id]).medical_centers,
                    with: Entities::MedicalCenter
          end
        end
      end
    end
  end
end
