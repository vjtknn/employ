module API
  module V1
    module Jobs
      class Show < Base
        params do
          requires :id, type: Integer, desc: 'Id of a certain job'
        end

        desc 'Return a job'
        get '/:id' do
          @job = Job.find_by(id: params[:id])
          if @job
            status :ok
            @job
          else
            status :not_found
            'Job not found'
          end
        end
      end
    end
  end
end
