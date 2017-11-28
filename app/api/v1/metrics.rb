module V1
  class Metrics < Grape::API
    resource :metrics do
      desc 'Get all metrics'
      get do
        present Metric.all, with: Entities::Metric
      end

      desc 'Create new metric'
      params do
        requires :name, type: String, desc: 'Metric name'
      end
      post do
        metric = Metric.create_from_params params
        error! 'Unprocessable Entity', 422 unless metric.save
        metric
      end

      route_param :id do
        desc 'Get metric by ID'
        get do
          metric = Metric.find_by_id(params[:id])
          error! 'Not Found', 404 unless metric
          present metric, with: Entities::Metric
        end

        resource :measurements do
          desc 'Get measurements from a specific Metric'
          get do
            metric = Metric.find_by_id(params[:id])
            error! 'Not Found', 404 unless metric
            present metric.measurements, with: Entities::Measurement
          end
        end
      end
    end
  end
end