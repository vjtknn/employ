require "rails_helper"

describe API::V1::Jobs::Create, type: :request do
  let(:endpoint) { "/api/v1/jobs/" }
  let(:params) { attributes_for(:job) }

  subject { post endpoint, params: params  }

  it 'should respond with 201 status code' do
    subject
    expect(response).to have_http_status :created
  end
end
