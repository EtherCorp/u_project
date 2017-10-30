module V1
    class Exams < Grape::API
      resource :exams do
        desc 'Get all Exams'
        get do
          present Exam.all, with: Entities::Exam
        end
  
        desc 'Create new exam'
        params do
          requires :consult_id, type: Integer, desc: 'Consult asociated to movement'
        end
        post do
          exam = Exam.new params
          exam.save!
          exam
        end
      end
    end
  end