module API
  module V1
    class Base < Core
      format :json
      version 'v1', using: :path, vendor: 'emplo'

      mount Jobs
    end
  end
end
