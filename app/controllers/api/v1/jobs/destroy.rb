module API
  module V1
    module Jobs
      class Destroy < Base
        desc 'Destroy a job'
        delete do
          if @job
            if @job.destroy
              status :ok
              'Job successfully deleted'
            end
          else
            status :not_found
            'Job not found'
          end
        end
      end
    end
  end
end
