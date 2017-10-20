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
        med_center = MedicalCenter.new params
        med_center.save!
        med_center
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
  end
end


