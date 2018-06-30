module API
  module V1
    module Jobs
      module Params
        extend Grape::API::Helpers

        params :job do
          requires :title, type: String, desc: 'Title for job'
        end
      end
    end
  end
end
