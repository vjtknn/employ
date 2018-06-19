module API
  class Core < Grape::API
    prefix :api
    mount API::V1::Base
  end
end
