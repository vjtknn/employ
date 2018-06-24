require "rails_helper"

describe API::V1::Jobs::Show, type: :request do
  let(:endpoint) { "/api/v1/jobs/#{id}" }
  let!(:job) { create(:job) }
  let(:id) { job.id }

  subject  { get endpoint }
  context 'when job exists' do
    it 'should return 200 status code' do
      subject
      expect(response).to have_http_status :ok
    end
  end

  context "when job does not exists" do
    let(:id) { 10 }
    it 'should have status not found' do
      subject
      expect(response).to have_http_status :not_found
    end
  end
end
