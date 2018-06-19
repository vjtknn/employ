module API
  module V1
    class Jobs < Base
        resources :jobs do
          desc 'return all of the jobs'
          get do
            Job.all
          end

        desc "Return a job"
        params do
          requires :id, type: String, desc: "ID of the
          job"
        end
        get '/:id' do
          Job.find(params[:id])
        end
      end
    end
  end
end
