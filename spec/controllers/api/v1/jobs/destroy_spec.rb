require "rails_helper"

describe API::V1::Jobs::Destroy, type: :request do
  let(:endpoint) { "/api/v1/jobs/#{id}" }
  let!(:job) { create(:job) }

  subject { delete endpoint }
  context 'when job exists' do
    let(:id) { job.id }
    it 'deletes a job' do
      expect{ subject }.to change(Job, :count).by(-1)
    end
  end

  context 'when job does not exists' do
    let(:id) { Job.maximum(:id).to_i.next }
    it 'returns 404 status code' do
      subject
      expect(response).to have_http_status :not_found
    end

    it 'returns error' do
      subject
      expect(JSON.parse(response.body)).to eq("Job not found")
    end
  end
end
