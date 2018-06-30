require "rails_helper"

describe API::V1::Jobs::Show, type: :request do
  let(:endpoint) { "/api/v1/jobs/#{id}" }
  let!(:job) { create(:job) }
  let(:id) { job.id }

  subject { patch endpoint, params: params }

  context 'with valid params' do
    let(:params) { attributes_for(:job, title: 'RoR dev') }
    it 'should return 200' do
      subject
      expect(response).to have_http_status :ok
    end

    it 'should have new title' do
      subject
      job.reload
      expect(job.title).to eq('RoR dev')
    end
  end

  context 'with invalid params' do
    let(:params) { attributes_for(:job, title: nil) }
    it 'should return error' do
      expect{ subject }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Title can't be blank")
    end
  end
end
