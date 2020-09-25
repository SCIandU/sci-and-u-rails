class MarsRatingsController < ApplicationController

  def new

    if MarsRating.exists?(user_id: current_user.id)
      @mars_rating = current_user.mars_rating
      if !@mars_rating.engagement1    
        flash[:notice] = "You've Requested Help To Complete Our Evaluation Form"
        redirect_to "/home/mars_will_contact"    
      #else    
      #  flash[:notice] = "You've already completed an Evaluation Form!"
      #  redirect_to "/home/mars_thanks" 
      #          
      end
    else
      session[:mars_rating_params] ||= {}
      @mars_rating = MarsRating.new(session[:mars_rating_params])
      @mars_rating.current_step = session[:mars_rating_step]
      if @mars_rating.tech_help
        flash[:notice] = "You've Requested Help To Complete Our Evaluation Form"
        redirect_to "/home/mars_will_contact" 
      end
    end
  end

  def index 
    redirect_to "/mars_ratings/new"
  end  

  def create
    session[:mars_rating_params].deep_merge!(params[:mars_rating]) if params[:mars_rating]
    @mars_rating = MarsRating.new(session[:mars_rating_params])
    @mars_rating.current_step = session[:mars_rating_step]

    if @mars_rating.valid?   
      if params[:back_button]
        @mars_rating.previous_step  
      elsif @mars_rating.first_step? && params[:mars_rating][:technical_help] == "true"
        @mars_rating.save  
      elsif @mars_rating.last_step?
        @mars_rating.save if @mars_rating.all_valid?
      else
        @mars_rating.next_step
      end
      session[:mars_rating_step] = @mars_rating.current_step
    else
      session[:mars_rating_step] = @mars_rating.current_step 
    end

    if @mars_rating.new_record?
      render "new"
    else
      session[:mars_rating_step] = session[:mars_rating_params] = nil
      if @mars_rating.first_step? && params[:mars_rating][:technical_help] == "true"
        flash[:notice] = "Request Help To Complete Our Evaluation Form"
        redirect_to "/contacts/mars_help"           
      else
        flash[:notice] = "Your evaluation has been saved!"
        redirect_to "/contacts/mars_thanks"          
      end
    end
  end

  def show
    @mars_rating = MarsRating.find(params[:id])
  end

  private

  def mars_rating_params
    # params.permit(:mars_rating_params, :mars_rating_step)
  end

end

#      if params[:mars_rating][:tech_help] == "1"
#        flash[:notice] = "Request Help Completing Evaluation Forms"
#        redirect_to "/contacts/mars_help"     
#      else
