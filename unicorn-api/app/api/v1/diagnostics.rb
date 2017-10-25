module V1
    class Diagnostics < Grape::API
      resource :diagnostics do
        desc 'Get all Diagnostics'
        get do
          present Diagnostic.all, with: Entities::Diagnostic
        end
  
        desc 'Create new diagnostic'
        params do
          requires :consult_id, type: Integer, desc: 'Consult asociated to movement'
        end
        post do
          diag = Diagnostic.new params
          diag.save!
          diag
        end
      end
    end
  end