require "rails_helper"

describe API::V1::Jobs::Update, type: :request do
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
      expect(job.reload.title).to eq(params[:title])
    end
  end

  context 'with invalid params' do
    let(:params) { attributes_for(:job, title: nil) }
    it 'should return 403' do
      subject
      expect(response).to have_http_status :forbidden
    end

    it 'should not change title' do
      subject
      expect(job.reload.title).to eq(job.title)
    end

    it 'returns errors' do
      subject
      expect(JSON.parse(response.body)).to eq({"title"=>["can't be blank"]})
    end
  end
end
