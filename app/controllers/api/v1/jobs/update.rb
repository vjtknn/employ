module API
  module V1
    module Jobs
      class Update < Base
        helpers Params

        params { use :job }

        desc 'Update a job'
        patch do
          if @job.update(params)
            status :ok
            @job
          else
            status :forbidden
            @job.errors
          end
        end
      end
    end
  end
end
