module API
  class V1 < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api

    resource :consults do
      desc 'Get all consults'
      get do
        present Consult.all, with: Entities::Consult
      end

      desc 'Create new consult'
      params do
        requires :patient_id, type: Integer, desc: 'Patient ID'
        requires :professional_id, type: Integer, desc: 'Professional ID'
        requires :date, type: Date, desc: 'Consult date'
        requires :reason, type: String, desc: 'Consult reason'
        requires :symptoms, type: String, desc: 'Symptoms'
        optional :observations, type: String, desc: 'Observations'
      end
      post do
        consult = Consult.new params
        consult.save!
        consult
      end

      route_param :consult_id do
        desc 'Get consult by ID'
        get do
          present Consult.find_by(id: params[:consult_id]), with: Entities::Consult
        end

        resource :movements do
          desc 'Get all movements from a consult'
          get do
            present Consult.find_by(id: params[:consult_id]).movements,
                    with: Entities::Movement
          end

          desc 'Create new movement for a specified consult'
          params do
            requires :consult_id, type: Integer, desc: 'Consult ID'
            requires :movement_type_id, type: Integer, desc: 'Movement type ID'
          end
          post do
            movement = Movement.new params
            movement.save!
            movement
          end

          route_param :movement_id do
            resource :details do
              desc 'Create movement detail for a specified movement from a consult'
              params do
                requires :movement_id, type: Integer, desc: 'Movement ID'
                requires :key, type: String, desc: 'Key'
                requires :value, type: String, desc: 'Value'
              end
              post do
                detail = MovementDetail.new declared(params, include_parent_namespaces: false)
                detail.save!
                detail
              end
            end

            resource :documents do
              desc 'Create document for a specified movement from a consult'
              params do
                requires :movement_id, type: Integer, desc: 'Movement ID'
                requires :doc_id, type: Integer, desc: 'Document ID'
              end
              post do
                document = Document.new declared(params, include_parent_namespaces: false)
                document.save!
                document
              end
            end
          end
        end
      end
    end

    resource :medical_centers do
      desc 'Get all medical centers'
      get do
        present MedicalCenter.all, with: Entities::MedicalCenter
      end

      route_param :id do
        desc 'Get medical center by ID'
        get do
          present MedicalCenter.find_by(id: params[:id]),
                  with: Entities::MedicalCenter
        end

        resource :professionals do
          desc 'Get all professionals from a specified medical center'
          get do
            present MedicalCenter.find_by(id: params[:id]).professionals,
                    with: Entities::Professional
          end
        end
      end
    end

    resource :movement_types do
      desc 'Get all movement types'
      get do
        present MovementType.all, with: Entities::MovementType
      end

      desc 'Create new movement type'
      params do
        requires :name, type: String, desc: 'Movement type name'
      end
      post do
        mov_type = MovementType.new params
        mov_type.save!
        mov_type
      end
    end

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
      end
    end

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

        resource :medical_centers do
          desc 'Get medical center(s) where a specified professional works'
          get do
            present Professional.find_by(id: params[:id]).medical_centers,
                    with: Entities::MedicalCenter
          end
        end
      end
    end

    resource :specialities do
      desc 'Get all specialities'
      get do
        present Speciality.all, with: Entities::Speciality
      end

      desc 'Create new speciality'
      params do
        requires :name, type: String, desc: 'Speciality name'
      end
      post do
        speciality = Speciality.new params
        speciality.save!
        speciality
      end
    end
  end
end