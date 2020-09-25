class HomeController < ApplicationController
  include HomeHelper

  before_action :authenticate_user!,
                except:  [:forgot_password,
                          :generate_new_password_email,
                          :password_reset_email]
  before_action :load_activities, only: :index

  def index
    @first_time = false
    @first_time = true if current_user.sign_in_count <= 1

    @departments = Department.all
  end

  def about; end

  def thank_you; end

  def wysiwyg_demo; end

  def forgot_password
    @forgot_password_flag = true
  end

  def generate_new_password_email
    @forgot_password_flag = true
    user = User.where(email: params[:email]).first
    if user.nil?
      flash[:notice] = "The user account with the email address #{params[:email]} was not found."
      return redirect_to home_password_reset_email_path
    end
    flash[:notice] = "Reset password instructions have been sent to #{user.email}."
    user.send_reset_password_instructions
    redirect_to home_password_reset_email_path
  end

  def password_reset_email
    @forgot_password_flag = true
  end

  def search
    @health_resource_results = HealthResource.search params['q']
    @blog_post_results = BlogPost.search params['q']
    @story_results = Story.search params['q']
    @salon_event_results = SalonEvent.search params['q']
    @search_request = params['q']
  end

  def coachportal
    @portalflag = true
  end

  def feed
    @salon_events = SalonEvent.all
  end

  def coaching
    return unless user_signed_in?
    return unless current_user.is_research_participant
    redirect_to "https://coaching.sci-and-u.ca"
  end

  def rest
    @json = rest_call
  end

  private

  def load_activities
    @activities = PublicActivity::Activity.order(created_at: :desc).limit(40) 
  end

end
