module API
  module V1
    module Jobs
      class Show < Base
        desc 'Return a job'
        get do
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
