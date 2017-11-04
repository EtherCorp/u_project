module V1
  class MedicalCenters < Grape::API
    resource :medical_centers do
      desc 'Get all medical centers'
      get do
        present MedicalCenter.all, with: Entities::MedicalCenter
      end

      desc 'Create medical center'
      params do
        requires :name, type: String, desc: 'Medical center name'
        requires :address, type: String, desc: 'Address'
      end
      post do
        medical_center = MedicalCenter.create_from_params params
        error! 'Unprocessable Entity', 422 unless medical_center.save
        medical_center
      end

      route_param :id do
        desc 'Get medical center by ID'
        get do
          medical_cemter = MedicalCenter.find_by_id(params[:id])
          error! 'Not Found', 404 unless medical_cemter
          present medical_cemter, with: Entities::MedicalCenter
        end

        resource :professionals do
          desc 'Get all professionals from a specified medical center'
          get do
            medical_center = MedicalCenter.find_by_id(params[:id])
            error! 'Not Found', 404 unless medical_center
            present medical_center.professionals, with: Entities::Professional
          end
        end

        resource :connection_tokens do
          desc 'Get all connection tokens from a specified medical center'
          get do
            medical_center = MedicalCenter.find_by_id(params[:id])
            error! 'Not Found', 404 unless medical_center
            present medical_center.connection_tokens,
                    with: Entities::ConnectionToken
          end
        end
      end
    end
  end
end


