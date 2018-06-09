class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
    @jobs = Job.all
    @employees = Employee.all
  end

  def create
    if @employee = Employee.create!(employee_params)
      redirect_to employees_path
    else
      render :new
    end
  end

  private
  def employee_params
    params[:employee].permit(:first_name, :last_name, :birth_date, :boss_id, :job_id)
  end
end
