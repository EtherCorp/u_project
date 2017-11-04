module V1
  class Measurements < Grape::API
    resource :measurements do
      desc 'Get all measurements'
      get do
        present Measurement.all, with: Entities::Measurement
      end

      desc 'Create new measurement'
      params do
        requires :metric_id, type: Integer, desc: 'Metric ID'
        requires :value, type: String, desc: 'Metric name'
      end
      post do
        measurement = Measurement.create_from_params params
        error! 'Unprocessable Entity', 422 unless measurement.save
        measurement
      end

      route_param :id do
        desc 'Get measurement by ID'
        get do
          measurement = Measurement.find_by_id(params[:id])
          error! 'Not Found', 404 unless measurement
          present measurement, with: Entities::Measurement
        end
      end
    end
  end
end