FactoryBot.define do
  factory :employee do
    first_name "John"
    last_name  "Doe"
    birth_date Date.new(1990, 2, 2)
    job Job.first
  end
end
