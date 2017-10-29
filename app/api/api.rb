module API
  class API < Grape::API
    format :json
    prefix :api

    version 'v1', using: :path do
      mount ::V1::Consults
      mount ::V1::MedicalCenters
      mount ::V1::MovementTypes
      mount ::V1::Patients
      mount ::V1::Professionals
      mount ::V1::Specialities
    end
  end
end