module API
  class API < Grape::API
    format :json
    prefix :api

    version 'v1', using: :path do
      mount ::V1::Accesses
      mount ::V1::ConnectionTokens
      mount ::V1::Consults
      mount ::V1::Measurements
      mount ::V1::MedicalCenters
      mount ::V1::Metrics
      mount ::V1::Movements
      mount ::V1::MovementDetails
      mount ::V1::Patients
      mount ::V1::Permissions
      mount ::V1::Professionals
      mount ::V1::Specialities
    end
  end
end