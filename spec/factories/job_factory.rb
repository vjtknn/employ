# == Schema Information
#
# Table name: jobs
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :job do
    title Faker::Job.title

    trait :without_title do
      title nil
    end
  end
end
