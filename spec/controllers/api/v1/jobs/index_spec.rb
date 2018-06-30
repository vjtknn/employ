require 'rails_helper'

describe API::V1::Jobs::Index, type: :request do
  before { create_list(:job, 15) }

  context 'for first 10 jobs' do
    let(:endpoint) { '/api/v1/jobs' }
    subject { get endpoint }

    it 'should have 200 status code' do
      subject
      expect(response).to have_http_status :ok
    end

    it 'should display only 10 jobs' do
      subject
      expect(JSON.parse(response.body).size).to eq(10)
    end
  end

  context 'for 5 next jobs' do
    let(:endpoint) { '/api/v1/jobs?page=2' }
    subject { get endpoint }

    it 'should have 200 status code' do
      subject
      expect(response).to have_http_status :ok
    end
    it 'should display only 5 jobs' do
      subject
      expect(JSON.parse(response.body).size).to eq(5)
    end
  end
end
