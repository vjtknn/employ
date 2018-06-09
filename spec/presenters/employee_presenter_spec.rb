require 'rails_helper'

describe EmployeePresenter do
  let(:job) { create(:job) }
  let(:employee) { create(:employee, job: job) }
  subject { EmployeePresenter.new(employee).full_name}
  it 'retunrs correct full name' do
    subject
    is_expected.to eq("John Doe")
  end
end
