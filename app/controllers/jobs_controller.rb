class JobsController < ApplicationController

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
end
