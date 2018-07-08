module API
  module V1
    module Jobs
      class Index < Base
        desc 'Return all of the jobs'
        paginate per_page: 10, offset: false
        get do
          paginate(Job.all)
        end
      end
    end
  end
end
