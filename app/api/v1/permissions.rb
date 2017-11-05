module V1
  class Permissions < Grape::API
    resource :permissions do
      desc 'Create new permission'
      params do
        requires :patient_id, type: Integer, desc: 'Patient ID'
        requires :professional_id, type: Integer, desc: 'Professional ID'
        requires :date, type: Date, desc: 'Permission date'
        requires :expiration, type: Date, desc: 'Permission expiration date'
      end
      post do
        permission = Permission.create_from_params params
        error! 'Unprocessable Entity', 422 unless permission.save
        permission
      end

      route_param :id do
        desc 'Get permission by ID'
        get do
          permission = Permission.find_by_id(params[:id])
          error! 'Not Found', 404 unless permission
          present permission, with: Entities::Permission
        end
      end

      desc 'Get permission by patient and professional IDs'
      params do
        requires :patient, type: Integer, desc: 'Patient ID'
        requires :professional, type: Integer, desc: 'Professional ID'
      end
      get do
        permission = Permission.find_by_patient_id_and_professional_id(params[:patient],
                                                                       params[:professional])
        error! 'Not Found', 404 unless permission
        present permission, with: Entities::Permission
      end
    end
  end
end