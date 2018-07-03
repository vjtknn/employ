require 'grape-swagger'

module API
  class Core < Grape::API
    prefix :api
    include Grape::Kaminari
    mount API::V1::Base

    add_swagger_documentation \
      mount_path: '/docs',
      info: { title: 'Employ API' }
  end
end
