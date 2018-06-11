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

FactoryBot.define do
  factory :employee do
    first_name "John"
    last_name  "Doe"
    birth_date Date.new(1990, 2, 2)
    job Job.first
  end
end
