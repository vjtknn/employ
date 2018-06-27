class EmployeesController < ApplicationController
  before_action :authenticate_user!

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
    @jobs = Job.all
    @employees = Employee.all
  end

  def create
    if Employee.create(employee_params)
      redirect_to employees_path
    else
      render :new
    end
  end

  def edit
    @employee = Employee.find(params)
  end

  def update
    if EmployeeForm.new(employee_params).update
      redirect_to employees_path
    else
      render :new
    end
  end

  private

  def employee_params
    params[:employee].permit(:first_name, :last_name, :boss_id, :job_id, :birth_date)
  end
end
