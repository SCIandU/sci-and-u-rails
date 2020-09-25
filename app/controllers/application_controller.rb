class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception, prepend: true
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :featured
  skip_before_action :verify_authenticity_token, raise: false
  # before_action :check_for_signed_in_user

  protected

  def featured
    @upcoming_events = SalonEvent.where("event_date >= ?", Time.zone.now).order("RANDOM()").limit(1)
    @podcasts = SalonEvent.where("event_date < ?", Time.zone.now).order("RANDOM()").limit(1)
    @featured_users = User.where("role = 2 OR role = 1").order("RANDOM()").limit(2)
    @featured_stories = Story.order("RANDOM()").limit(1)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :login, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :login, :email, :current_password, :job_title, :blurb, :password, :password_confirmation, roles: []) }
  end
end
