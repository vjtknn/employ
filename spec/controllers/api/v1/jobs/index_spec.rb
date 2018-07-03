require 'rails_helper'

describe API::V1::Jobs::Index, type: :request do
  before { create_list(:job, 15) }
  subject { get endpoint }

  context 'with first page' do
    let(:endpoint) { '/api/v1/jobs' }

    it 'has 200 status code' do
      subject
      expect(response).to have_http_status :ok
    end

    it 'returns 10 jobs' do
      subject
      expect(JSON.parse(response.body).size).to eq(10)
    end
  end

  context 'with second page' do
    let(:endpoint) { '/api/v1/jobs?page=2' }

    it 'has 200 status code' do
      subject
      expect(response).to have_http_status :ok
    end
    it 'returns 5 jobs' do
      subject
      expect(JSON.parse(response.body).size).to eq(5)
    end
  end
end
