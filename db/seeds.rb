10.times do
  Job.create!(
    title: Faker::Job.title
  )
end

30.times do
  Employee.create!(
    birth_date: Faker::Date.birthday(18, 65),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    job_id: Job.ids.sample
  )
end
