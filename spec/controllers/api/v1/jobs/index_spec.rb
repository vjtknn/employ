require "rails_helper"

describe API::V1::Jobs::Index, type: :request do
  let(:endpoint) {'/api/v1/jobs'}

  let!(:job1) { create(:job) }
  let!(:job2) { create(:job) }
  let!(:job3) { create(:job) }

  let(:params) { { per_page: 2} }
  subject { get endpoint, params: params }
  it 'should have 200 status code' do
    subject
    expect(response).to have_http_status :ok
  end
end
