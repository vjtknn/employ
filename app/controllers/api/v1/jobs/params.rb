module API
  module V1
    module Jobs
      module Params
        extend Grape::API::Helpers

        params :create_job do
          requires :title, type: String, desc: 'Title for the new job'
        end

      end
    end
  end
end
