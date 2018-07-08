module API
  module V1
    module Jobs
      class Create < Base
        helpers Params

        params { use :job }

        desc 'Create a job'
        post do
          @job = Job.new(params)
          if @job.save
            status :created
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
