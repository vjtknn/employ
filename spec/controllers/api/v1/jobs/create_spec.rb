require "rails_helper"

describe API::V1::Jobs::Create, type: :request do
  let(:endpoint) { "/api/v1/jobs/" }

  subject { post endpoint, params: params  }

  context 'with valid params' do
    let(:params) { attributes_for(:job) }

    it 'has 201 status code' do
      subject
      expect(response).to have_http_status :created
    end

    it 'should be one more job' do
      expect{ subject }.to change(Job, :count).by(1)
    end

    it 'returns newly created job (with right title)' do
      subject
      expect(JSON.parse(response.body)['title']).to eq(params[:title])
    end
  end

  context 'with invalid params' do
    let(:params) { attributes_for(:job, :without_title) }

    it 'has 403 status code' do
      subject
      expect(response).to have_http_status :forbidden
    end

    it 'should not change jobs number' do
      expect{ subject }.not_to change(Job, :count)
    end

    it 'returns errors' do
      subject
      expect(JSON.parse(response.body)).to eq({"title"=>["can't be blank"]})
    end
  end
end
