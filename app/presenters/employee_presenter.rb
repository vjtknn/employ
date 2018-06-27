class EmployeePresenter
  def initialize(employee)
    @employee = employee
  end

  def full_name
    @employee.first_name + ' ' + @employee.last_name
  end
end
