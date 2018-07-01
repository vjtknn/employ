module API
  module V1
    module Jobs
      class Base < Core
        namespace :jobs do
          before do
            @job = Job.find_by(id: params[:id])
          end

          mount Index
          mount Show
          mount Create
          mount Update
          mount Destroy
        end
      end
    end
  end
end
