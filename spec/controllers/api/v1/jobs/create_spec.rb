require "rails_helper"

describe API::V1::Jobs::Create, type: :request do
  let(:endpoint) { "/api/v1/jobs/" }

  subject { post endpoint, params: params  }

  context 'with valid params' do
    let(:params) { attributes_for(:job) }

    it 'should respond with 201 status code' do
      subject
      expect(response).to have_http_status :created
    end

    it 'should be one more job' do
      expect{ subject }.to change(Job, :count).by(1)
    end
  end

  context 'with invalid params' do
    let(:params) { attributes_for(:job, :without_title) }

    it 'should rise error' do
      expect{ subject }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Title can't be blank")
    end
  end
end
