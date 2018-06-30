module API
  module V1
    module Jobs
      class Destroy < Base
        params do
          requires :id, type: Integer, desc: 'Id of a certain job'
        end

        desc 'Destroy a job'
        delete '/:id' do
          @job = Job.find_by(id: params[:id])
          @job.destroy!
        end
      end
    end
  end
end
