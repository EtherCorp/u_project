module V1
    class Licenses < Grape::API
      resource :licenses do
        desc 'Get all Licenses'
        get do
          present License.all, with: Entities::License
        end
  
        desc 'Create new license'
        params do
          requires :consult_id, type: Integer, desc: 'Consult asociated to movement'
        end
        post do
          lic = License.new params
          lic.save!
          lic
        end
      end
    end
  end