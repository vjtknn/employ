class EmployeeForm
  include ActiveModel::Model

  attr_accessor :first_name, :last_name, :birth_date, :job_id, :boss_id

  validates_presence_of :first_name, :last_name, :birth_date

  validates :job_id, 

  def create
    binding.pry
    if valid?
      Employee.create!(
        first_name: first_name,
        last_name: last_name,
        birth_date: birth_date,
        job: job,
        boss: boss
      )
      true
    else
      false
    end
  end

  def update
    if valid?
      Employee.update!(
        first_name: first_name,
        last_name: last_name,
        birth_date: Date.new(birth_date),
        job_id: job_id,
        boss_id: boss_id,
      )
      true
    else
      false
    end
  end
end
