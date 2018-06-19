module API
  module V1
    class Base < Core
      version 'v1', using: :path, vendor: 'emplo'

      mount Jobs
    end
  end
end
