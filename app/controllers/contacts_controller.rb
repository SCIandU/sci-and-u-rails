class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, raise: false
  
  def new
    @contact = Contact.new
  end

  def mars_help
    @contact = Contact.new
  end

  def mars_thanks
    @contact = Contact.new
  end

  def coachform
    @portalflag = true
    @contact = Contact.new
  end

  def feedback    
    @contact = Contact.new
  end

  def create
    @portalflag = true
    @contact = Contact.new(params[:contact])
    p @contact.form_type
    @contact.request = request
    @bladder = Story.where('department_id = 4')
    @bowel = Story.where('department_id = 1')
    @skin = Story.where('department_id = 2')
    @exercise = Story.where('department_id = 3')
    @sciu = Story.where('department_id = 5')
    @diet = Story.where('department_id = 9')
    @pain = Story.where('department_id = 10')
    @family = Story.where('department_id = 11')
    @sex = Story.where('department_id = 7')
    @sciu = Story.where('department_id = 5')

    if @contact.deliver
      p "deliver"
      if @contact.form_type == 'CoachForm'
        flash[:notice] = 'Thank you for reaching out. '\
                            'We will be in touch when the second round of the SCI & U coaching service is about to begin (Winter 2019).'
      elsif @contact.form_type == 'ManagementStory'
        flash[:notice] = 'Thank you for your input. '\
                            'We will be in touch shortly to learn more about your story.'
        redirect_to '/stories/'
      elsif @contact.form_type == 'MARSThanks'
        redirect_to '/home/mars_thanks'
      elsif @contact.form_type == 'Feedback'
        flash[:notice] = 'Thank you for your feedback. '\
                            'We appreciate your input and will strive to improve the site based on your comments.'
        redirect_to '/'
      elsif @contact.form_type == 'NeedHelp'
        redirect_to '/home/mars_will_contact'
      end
    else
      p "here"
      p @contact.errors.full_messages.to_sentence
      flash[:notice] = @contact.errors.full_messages.to_sentence
      if @contact.form_type == 'CoachForm'
        redirect_to  '/contacts/coachform'
      elsif @contact.form_type == 'Feedback'
        redirect_to '/contacts/feedback'
      elsif @contact.form_type == 'ManagementStory'
        redirect_to '/contacts/new'
      elsif @contact.form_type == 'MARSThanks'
        redirect_to '/contacts/mars_thanks'
      elsif @contact.form_type == 'NeedHelp'
        redirect_to '/contacts/mars_help'
      end
    end
  end

  private

end
