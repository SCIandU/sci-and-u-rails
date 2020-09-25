class IntakeFormsController < ApplicationController

  def new
    @intake_form = IntakeForm.new
  end

  def create
    if current_user.coach_id == ""
      render 'new'
      flash[:alert] = "This form is to be completed after you have indicated a coach selection.  Please select a coach before proceeding."
      redirect_to "/users/coaches"    
    else
      @intake_form = IntakeForm.new(intake_form_params)
      @intake_form.user_id = current_user.id
      if @intake_form.save
        if current_user.coach_id == ""
          flash[:alert] = "This form is intended for use after you have selected a coach.  Please browse our coaches, and indicate your preference before completing the form."
          redirect_to "/users/coaches" 
        else
          @coach = User.find(current_user.coach_id)
          flash[:success] = "Thank you for your submission.  #{@coach.first_name} #{@coach.last_name} has been notified of your interest.  Please allow 48 hours to receive a response to your coaching request."
          redirect_to "/"  
        end
      end
    end
  end

  private

  def intake_form_params
    params.require(:intake_form).permit!   
  end

end
