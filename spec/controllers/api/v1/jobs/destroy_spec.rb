require "rails_helper"

describe API::V1::Jobs::Show, type: :request do
  let(:endpoint) { "/api/v1/jobs/#{id}" }
  let!(:job) { create(:job) }
  let(:id) { job.id }

  subject { delete endpoint }
  context 'when job exists' do
    it 'should delete one job' do
      expect{ subject }.to change(Job, :count).by(-1)
    end
  end
end
