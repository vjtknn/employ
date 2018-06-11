namespace :basic_data do

  desc 'creates basic data for application to run'
  task jobs: :environment do
    jobs = %w(CEO CFO CTO CSO COO Gardener Magician)
    jobs.each do |job|
      Job.create!(title: job)
    end
  end

  desc 'create departments for company'
  task departments: :environment do
    departments = %w(Main, Supporting, Operations, Recrutation, Mining)
    departments.each do |dep|
      Department.create!(name: dep)
    end
  end

  desc 'create boss user'
  task boss: :environment do
    Employee.create!(first_name: 'Jan', last_name: 'Nowak', birth_date: Date.new(1979, 01, 01), job_id: Job.find_by(title: 'CEO').id)
  end

  
end
