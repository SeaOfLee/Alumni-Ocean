class JobsController < ApplicationController
  before_filter :authorize

  def search
    if params[:search].present?
      @jobs = Job.search params[:search],
      fields: [{company: :word_middle},
              {location: :word_middle},
              {description: :word_middle},
              {contact: :word_middle},
              {job_type: :word_middle},
              {job_title: :word_middle}
            ]
    else
      @jobs = Job.all
      @jobs = Job.order('created_at DESC').paginate(:page => params[:page], :per_page =>10)
    end
  end

  def index
    @jobs = Job.all
    @jobs = Job.order('created_at DESC').paginate(:page => params[:page], :per_page =>10)
  end

  def new
    @job = Job.new
  end

  def create
    @job = current_user.jobs.build(job_params)

    if @job.save
      redirect_to @job
    else
      render 'new'
    end
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to @job
    else
      render 'edit'
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def show
    @job = Job.find(params[:id])
  end

  def destroy
    Job.find(params[:id]).destroy
    redirect_to jobs_path
  end

  private
    def job_params
          params.require(:job).permit(:job_title, :company, :location, :job_type, :description, :contact, :lat, :long)
    end
end
