require_dependency("lib/storage/services/google_drive")
module V1
  class MovementDetails < Grape::API
    content_type :docx, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
    content_type :pdf, 'application/pdf'
    content_type :jpg, 'image/jpg'
    content_type :png, 'image/png'

    resource :details do
      route_param :id do
        desc 'Get movement detail by ID'
        get do
          detail = MovementDetail.find_by_id(params[:id])
          error! 'Not Found', 404 unless detail

          present detail, with: Entities::MovementDetail unless detail.key == 'file'

          file_data = eval detail.value
          service = Services::GoogleDrive.new
          response = Storage::Storage.download file_data, service

          content_type response[:mime]
          header "Content-Disposition", "attachment; filename=#{response[:name]}"
          response[:data]
        end
      end
    end
  end
end

