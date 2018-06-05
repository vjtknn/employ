class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end

  def new
    @employee_form = EmployeeForm.new
  end

  def create

  end

end
