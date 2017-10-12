module V1
  class Specialities < Grape::API
    resource :specialities do
      desc 'Get all specialities'
      get do
        present Speciality.all, with: Entities::Speciality
      end

      desc 'Create new speciality'
      params do
        requires :name, type: String, desc: 'Speciality name'
      end
      post do
        speciality = Speciality.new params
        speciality.save!
        speciality
      end
    end
  end
end
