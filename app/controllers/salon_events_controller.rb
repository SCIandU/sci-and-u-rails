class SalonEventsController < ApplicationController
  before_filter :authenticate_user!
  before_action :update_total_page_views, only: [:show, :index]  

  def new
    @salon_event = SalonEvent.new
  end

  def create
    @salon_event = SalonEvent.new(salon_event_params)
    # @salon_event.department_id = @department.id FORGOT TO ADD THIS!!
    if @salon_event.save
      redirect_to home_thank_you_url
    else
      render 'new'
    end
  end

  def show
    @salon_event = SalonEvent.find(params[:id])
    @question = Question.new
    @sponsor = @salon_event.sponsor
    impressionist(@salon_event)    
  end

  def index
    @upcoming = SalonEvent.where('event_date >= ?', Time.zone.now.beginning_of_day)\
                              .sort_by(&:event_date)
    @archived = SalonEvent.where('event_date < ?', Time.zone.now.beginning_of_day)\
                          .sort_by(&:event_date)
  end

  def archive
    @salon_events = SalonEvent.where("event_date < ?", Time.zone.now.beginning_of_day)\
                              .sort_by(&:event_date)
  end

  def edit; end

  def update
    if @salon_event.update_attributes(salon_event_params)
      redirect_to salon_event_path(@salon_event)
    else
      render 'new'
    end
  end

  # def destroy
  # end

  private

  def update_total_page_views
    if current_user.total_time_online
      result = current_user.total_time_online + 1
    else
      result = 1
    end
    current_user.update_attributes(:total_time_online => result)
  end

  def find_salon_event
    @salon_event = SalonEvent.find(params[:id])
  end

  def salon_event_params
    params.require(:salon_event).permit(
      :title,
      :description,
      :event_date,
      :url,
      :image,
      :url,
      :department_id,
      :organizational_affiliation
    )
  end
end
