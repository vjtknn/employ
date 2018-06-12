class JobsController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @jobs = Job.all
    authorize @jobs
  end

  def new
    @job_form = JobForm.new
    authorize @job_form
  end

  def create
    @job_form = JobForm.new(params[:job_form].permit(:title))
    authorize @job_form
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
