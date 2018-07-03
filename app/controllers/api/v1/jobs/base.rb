module API
  module V1
    module Jobs
      class Base < Core
        namespace :jobs do
          mount Index
          mount Create

          route_param :id, type: Integer do
            before do
              @job = Job.find_by(id: params[:id])
            end
            mount Show
            mount Update
            mount Destroy
          end
        end
      end
    end
  end
end
