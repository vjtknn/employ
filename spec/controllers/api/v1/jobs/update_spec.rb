require "rails_helper"

describe API::V1::Jobs::Update, type: :request do
  let(:endpoint) { "/api/v1/jobs/#{id}" }
  let!(:job) { create(:job) }
  let(:id) { job.id }

  subject { patch endpoint, params: params }

  let(:params) { attributes_for(:job, title: title) }

  context 'with valid params' do
    let(:title) { 'Meticulous code reviewer' }
    it 'returns 200' do
      subject
      expect(response).to have_http_status :ok
    end

    it 'changes a title' do
      subject
      expect(job.reload.title).to eq(title)
    end
  end

  context 'with invalid params' do
    let(:title) { nil }
    it 'returns 403' do
      subject
      expect(response).to have_http_status :forbidden
    end

    it 'does not change title' do
      subject
      expect(job.reload.title).to eq(job.title)
    end

    it 'returns errors' do
      subject
      expect(JSON.parse(response.body)).to eq({"title"=>["can't be blank"]})
    end
  end
end
