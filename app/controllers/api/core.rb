module API
  class Core < Grape::API
    prefix :api
    include Grape::Kaminari
    
    mount API::V1::Base

  end
end
