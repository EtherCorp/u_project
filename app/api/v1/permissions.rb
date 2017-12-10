module V1
  require 'time'
  class Permissions < Grape::API
    resource :permissions do
      desc 'Create new permission'
      params do
        requires :professional_id, type: Integer, desc: 'Professional ID'
        requires :permission_token, type: String, desc: 'Permission Token Provided'
      end
      post do
        mongo_connection = MongoConnection.new
        verified_token = mongo_connection.find_by_permission_token(params[:permission_token])
        error! 'Token Not Found', 404 unless verified_token['patient_id']
        params[:patient_id] = verified_token['patient_id']
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

      desc 'Get a new permission token'
      params do
        requires :patient, type: Integer, desc: 'Patient ID'
      end
      get do
        patient = Patient.find_by_id(params[:patient])
        error! 'Patient Not Found', 404 unless patient
        token = Permission.create_permission_token
        data = { permission_token: token,
                 patient_id: params[:patient],
                 created_at: Time.now }
        mongo_connection = MongoConnection.new
        persisted_token = mongo_connection.save_permission_token(data)
        error! 'Unprocessable Entity', 422 unless persisted_token
        token
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
