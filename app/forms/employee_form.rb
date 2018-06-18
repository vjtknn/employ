class EmployeeForm
  include ActiveModel::Model

  attr_accessor :first_name, :last_name, :birth_date, :job_id, :boss_id

  validates_presence_of :first_name, :last_name, :birth_date

  validates :job_id, presence: true

  def create
    if valid?
      Employee.create!(
        first_name: first_name,
        last_name: last_name,
        birth_date: birth_date,
        job_id: job_id,
        boss_id: boss_id,
      )
      true
    else
      false
    end
  end
end
