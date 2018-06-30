class JobsController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @jobs = Job.all
    authorize @jobs
  end

  def show
    @job = Job.find(params[:id])
    authorize @job
  end

  def new
    @job_form = JobForm.new
    authorize @job_form
  end

  def create
    @job_form = JobForm.new(params[:job_form].permit(:title))
    authorize @job_form
    if @job_form.create
      redirect_to jobs_path
    else
      render :new
    end
  end

  # def edit
  #   @job = Job.find(params[:id])
  #   authorize @job
  # end
  #
  # def update
  #   @job_form = JobForm.new(params[:job].permit(:id, :title))
  #   authorize @job_form
  #   if @job_form.update
  #     redirect_to jobs_path
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    @job = Job.find(params[:id])
  end
end
