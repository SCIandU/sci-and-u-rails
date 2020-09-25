class EventRegistrationsController < ApplicationController
  before_action :find_salon_event

  def new
    @salon_event = SalonEvent.find(params[:salon_event_id])
    @test = @salon_event.event_registrations.where(user_id: current_user.id)
    if @test.count.positive?
      redirect_to salon_event_path(params[:salon_event_id]), notice: "You are registered for this event. To un-register, please contact <a href='mailto:SCIandUstudy@utoronto.ca'>SCIandUstudy@utoronto.ca</a>."
    else
      if @salon_event.event_registrations.count > 10
        flash[:notice] = "Sorry, this event is over-subscribed! You can add your name to the waiting list for the event below."
      end
      @event_registration = EventRegistration.new
    end
  end

  def show
    @count = @salon_event.event_registrations.count
  end

  def create
    @salon_event = SalonEvent.find(params[:salon_event_id])
    if @salon_event.event_registrations.count > 10
      @registration = EventRegistration.new(event_registration_params)
      if @registration.save
        if params[:tech_help]
          redirect_to salon_event_path(params[:salon_event_id]), notice: "Thank you. You have been added to the waiting list for this event and will be contacted by an SCI&U administrator for technical support.  If someone cancels their registration, users on the wait list will be notified in order."
        else
          redirect_to salon_event_path(params[:salon_event_id]), notice: "Thank you. You have been added to the waiting list for this event.  If someone cancels their registration, users on the wait list will be notified in order."
        end
      else
        flash[:notice] = "Your registration was not saved!"
        render 'new'
      end
    else
      @event_registration = EventRegistration.new(event_registration_params)
      if @event_registration.save
        if params[:tech_help]
          redirect_to salon_event_path(params[:salon_event_id]), notice: "Thank you. You have been registered for this event and will be contacted by an SCI&U administrator for technical support.  You will receive an email reminder about the event 24 hours before it begins. To un-register, please email <a href='mailto:events@sci-and-u.ca'>events@sci-and-u.ca</a>."
        else
          redirect_to salon_event_path(params[:salon_event_id]), notice: "Thank you. You are now registered for this event. You will receive an email reminder about the event 24 hours before it begins. To un-register, please email <a href='mailto:events@sci-and-u.ca'>events@sci-and-u.ca</a>."
        end
      else
        flash[:notice] = "Your registration was not saved!"
        render 'new'
      end
    end
  end

  private

  def event_registration_params
    params.permit(:user_id, :salon_event_id, :waitist, :tech_help)
  end

  def find_salon_event
    @salon_event = SalonEvent.find(params[:salon_event_id])
  end
end
