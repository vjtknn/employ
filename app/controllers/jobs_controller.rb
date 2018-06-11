class JobsController < ApplicationController
  before_action :authenticate_user!

  def index
    @jobs = Job.all
  end

  def new
    @job_form = JobForm.new
  end

  def create
    @job_form = JobForm.new(params[:job_form].permit(:title))
    if @job_form.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params)
  end


end
