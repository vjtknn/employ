require "rails_helper"

describe API::V1::Jobs::Show, type: :request do
  let(:endpoint) { "/api/v1/jobs/#{id}" }
  let!(:job) { create(:job) }
  let(:id) { job.id }

  subject  { get endpoint }
  context 'when job exists' do
    it 'returns 200 status code' do
      subject
      expect(response).to have_http_status :ok
    end

    it 'returns job' do
      subject
      expect((response.body)).to eq(job.to_json)
    end
  end

  context "when job does not exists" do
    let(:id) { Job.maximum(:id).to_i.next }
    it 'has status not found' do
      subject
      expect(response).to have_http_status :not_found
    end
  end
end
