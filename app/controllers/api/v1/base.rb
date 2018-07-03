module API
  module V1
    class Base < Core
      format :json
      version 'v1', using: :path, vendor: 'employ'

      mount Jobs::Base
    end
  end
end
