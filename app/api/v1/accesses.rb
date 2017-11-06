module V1
  class Accesses < Grape::API
    resource :accesses do
      desc 'Get all accesses'
      get do
        present Access.all, with: Entities::Access
      end

      desc 'Create new access'
      params do
        requires :access_type, type: String, desc: 'Access type'
      end
      post do
        access = Access.create_from_params params
        error! 'Unprocessable Entity', 422 unless access.save
        access
      end

      route_param :id do
        desc 'Get access by ID'
        get do
          access = Access.find_by_id(params[:id])
          error! 'Not Found', 404 unless access
          present access, with: Entities::Access
        end

        resource :permissions do
          desc 'Get permissions from a specific Access'
          get do
            access = Access.find_by_id(params[:id])
            error! 'Not Found', 404 unless access
            present access.permissions, with: Entities::Permission
          end
        end
      end
    end
  end
end