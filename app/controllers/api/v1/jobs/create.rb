module API
  module V1
    module Jobs
      class Create < Base
        helpers Params

        params { use :create_job}

        desc 'Create a job'
        post do
          Job.create!(params)
        end
      end
    end
  end
end
