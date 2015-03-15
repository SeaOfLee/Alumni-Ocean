class ActivitiesController < ApplicationController
  before_filter :authorize

  def search
    if params[:search].present?
      @activities = Activity.search params[:search],
      fields: [{event_name: :word_middle},
              {event_location: :word_middle},
              {event_description: :word_middle},
              {event_site: :word_middle},
            ]
      @activities = Activity.order('created_at DESC').paginate(:page => params[:page], :per_page =>10)
    else
      @activities = Activity.all
      @activities = Activity.order('created_at DESC').paginate(:page => params[:page], :per_page =>10)
    end
  end
  def index
    @activities = Activity.all
    @activities = Activity.order('created_at DESC').paginate(:page => params[:page], :per_page =>10)
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = current_user.activities.build(activity_params)

    if @activity.save
      redirect_to @activity
    else
      render 'new'
    end
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update(activity_params)
      redirect_to @activity
    else
      render 'edit'
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def destroy
    Activity.find(params[:id]).destroy
    redirect_to activities_path
  end

  private
    def activity_params
      params.require(:activity).permit(:event_name, :event_location, :event_description, :event_site, :event_date, :event_time, :lat, :long)
    end
end
