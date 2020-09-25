class UsersController < ApplicationController
  require 'date'
  include UsersHelper

  before_action :authenticate_user!
  before_action :update_total_page_views, only: :show

  def index
    @users = User.all
    respond_to do |format|
      @participants = User.where('is_research_participant = false');
      format.json { render json: @participants, except: [:provider, :email, :created_at, :updated_at, :organizational_affiliations,:sponsor_id,:coach_id,:coach_status, :skypehandle, :approved,:is_research_participant, :how, :read_form, :orientation, :with_sci, :total_time_online, :dob, :whyhere, :uid, :allow_api_access ]  }
    end    
  end

  def coaches
    @users = User.where('role = 2')
  end

  def experts
    @admins = User.where('role = 0')
    @experts = User.where('role = 1')
    @advisors = User.where('role = 4')
    @coaches = User.where('role = 2')    
  end

  def badge_administration
    @badges = Merit::Badge.all
    @coachees = User.where('program_status = 0')
    @coaches = User.where('role = 2') 
  end  

  def resource_administration
    
    if (!params[:user_id])
      @user_admin = false
      @coachees = User.where('program_status = 0')
      @coaches = User.where('role = 2') 
      @resources = HealthResource.all
    else
      @user_admin = true
      @coachees = User.find(params[:user_id].to_i)
      @coaches = User.find(@coachees.coach_id)
      @resources = @coachees.favorites
      @resources = @resources.reject { |c| c.session == nil }  
    end

  end    

  def destroy
    render 'edit'
  end

  def add_resources

    @health_resource = HealthResource.find(params[:resource_id])
    if params[:session_id]
      @session = params[:session_id].to_i
    end
    @user_id = params[:user_id].to_i
    @user = User.find(@user_id)
    @commit = params[:commit]

    if @commit == "X" || @commit == "Remove"
      if @user.favorite_resources.include? @health_resource
        @user.favorite_resources.delete(@health_resource)
      end
      if (!@session)
        @response = "resource #{@health_resource.title} removed from user #{@user.first_name}.  Please refresh this page after closing."        
      else
        @response = "resource #{@health_resource.title} removed from user #{@user.first_name} for session #{@session}."
      end
    else 
      if !@user.favorite_resources.include? @health_resource
        @user.favorite_resources << @health_resource
        Favorite.update(Favorite.order("created_at").last.id, :session => @session)
      end
      @response = "resource #{@health_resource.title} added to user #{@user.first_name} for session #{@session}."
    end

  end  

  def add_badges
    badge_tally = Hash.new
    params.each_pair { |pair| 
      pair_array = pair.split("-")
      if pair_array.length > 1
        if (pair_array[0] == "badge") 
          badge_tally[pair_array[1]] = "true"  
          pair_array_sub = pair_array[1].split("_") 
          @user = User.find(pair_array_sub[0])          
          if !@user.badges.include? Merit::Badge.find(pair_array_sub[1].to_i)
            @user.add_badge(pair_array_sub[1])
            @user.badge_updated = true
            @user.save
          end
        end   
      end 
    }
    params.each_pair { |pair| 
      pair_array = pair.split("-")
      if pair_array.length > 1
        if (pair_array[0] == "hidden") 
          if !(badge_tally[pair_array[1]])
            pair_array_sub = pair_array[1].split("_")  
            @user = User.find(pair_array_sub[0])
            @user.rm_badge(pair_array_sub[1])           
          end
        end   
      end 
    }   

    @response = "client badges have been updated."
 
  end

  def show
    @user = User.find(params[:id])
    @blog_posts = @user.blog_posts[0..4]
    @blog_comments = @user.blog_comments[0..4]
    @favorites = @user.favorites
    @favorites = @favorites.reject { |c| c.session != nil }  
    @favorites = @favorites[0..4]
    @reviews = @user.reviews[0..4]
    @health_resources = @user.health_resources[0..4]
    @sponsors = @user.sponsors
    @badges = @user.badges    
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if params[:coach_id]
      if params[:coach_id] == @user.coach_id.to_s
        flash[:success] = "You have already requested the services of this coach!"
        redirect_to "/users/#{params[:coach_id]}"
      else
        @coach = User.find(params[:coach_id])
        flash[:success] = "Thank you for your interest in SCI + U coaching. #{@coach.first_name} #{@coach.last_name} will be alerted that you are interested in caoching service.  To complete the process, please fill out the intake form that is below."
        @user.update_attributes("coach_id" => params[:coach_id], "coach_status" => params[:coach_status])
        redirect_to "/intake_forms/new"
      end
    else
      if @user.update_attributes(user_params)
        if params[:user][:profile_image].present?
          render :crop
        elsif params[:user][:crop_x].present?
          redirect_to @user, notice: "Successfully updated user." if @user.save
        else
          redirect_to @user, notice: "Successfully updated user."
        end
      else
        render 'edit'
      end
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      if params[:user][:profile_image].present?
        render :crop
      else
        redirect_to @user, notice: "Successfully created user."
      end
    else
      render :new
    end
  end

  private

  def update_total_page_views
    if current_user.total_time_online
      result = current_user.total_time_online + 1
    else
      result = 1
    end
    current_user.update_attributes(:total_time_online => result)
  end

  def user_params
    params.require(:user).permit(
      :crop_x,
      :crop_y,
      :crop_w,
      :crop_h,
      :email,
      :first_name,
      :last_name,
      :job_title,
      :role,
      :login,
      :age,
      :gender,
      :dob,
      :injury_date,
      :whyhere,
      :with_sci,
      :injury_level,
      :profile_image,
      :blurb,
      :location,
      :organizational_affiliations,
      :sponsor_id,
      :coach_id,
      :coach_status,
      :skypehandle
    )
  end

end
