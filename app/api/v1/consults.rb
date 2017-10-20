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
          present Consult.find_by(id: params[:consult_id]),
                  with: Entities::Consult
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
  end
end


