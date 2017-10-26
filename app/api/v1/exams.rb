module V1
    class Exams < Grape::API
      resource :exams do
        desc 'Get all Exams'
        get do
          present Exam.all, with: Entities::Exam
        end
  
        desc 'Create new exam from RUNs'
        params do
          requires :patient_rut, type: String, desc: 'Patient rut from a movement'
          requires :professional_rut, type: String, desc: 'Professional rut from a movement'
        end
        post do
          exam = Exam.new
          return nil if (exam.consult! params[:patient_rut], params[:professional_rut]) == nil
          exam.save!
          exam
        end
      end
    end
  end