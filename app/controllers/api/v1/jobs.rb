module API
  module V1
    class Jobs < Base
      namespace :jobs do
        desc 'return all of the jobs'
        get do
          Job.all
        end
      end
    end
  end
end
