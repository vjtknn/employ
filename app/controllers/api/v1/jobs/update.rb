module API
  module V1
    module Jobs
      class Update < Base
        helpers Params

        params do
          requires :id, type: Integer, desc: 'Id of a certain job'
        end

        params { use :job }

        desc 'Update a job'
        patch '/:id' do
          @job = Job.find_by(id: params[:id])
          @job.update!(params)
        end
      end
    end
  end
end
