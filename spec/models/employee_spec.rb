# == Schema Information
#
# Table name: employees
#
#  id         :bigint(8)        not null, primary key
#  birth_date :datetime         not null
#  first_name :string           not null
#  last_name  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  boss_id    :bigint(8)
#  job_id     :bigint(8)
#
# Indexes
#
#  index_employees_on_boss_id  (boss_id)
#  index_employees_on_job_id   (job_id)
#
# Foreign Keys
#
#  fk_rails_...  (boss_id => employees.id)
#  fk_rails_...  (job_id => jobs.id)
#

require 'rails_helper'

RSpec.describe Employee, type: :model do

  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of(:birth_date) }
  it { is_expected.to validate_presence_of(:job) }

end
