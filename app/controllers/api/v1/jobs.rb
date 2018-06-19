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

        desc 'Create a job'
        params do
          requires :title, type: String, desc: 'Title for new job'
        end
        post do
          Job.create!(title: params[:title])
        end
      end
    end
  end
end
