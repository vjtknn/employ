module API
  module V1
    class Jobs < Base
      desc 'return all of the jobs'
      get do
        Job.all
      end
    end
  end
end
