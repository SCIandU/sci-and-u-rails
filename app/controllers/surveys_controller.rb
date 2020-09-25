class SurveysController < ApplicationController
  #before_filter :authenticate_user! 
  
  def show
    @survey = Survey.find(params[:id])
    @survey_questions = @survey.survey_questions
    @department = @survey.department_id
  end

  def index
    @surveys= Survey.paginate(:page => params[:page], :per_page => 18)  
    if params[:department_id]
      @other_surveys = Survey.where('department_id = ' + params[:department_id])
      @surveys = @other_surveys.paginate(:page => params[:page], :per_page => 12)
    end  
  end

  def mark
    @survey = Survey.find(params[:id]) 
    @survey_questions = @survey.survey_questions  
    
    @counter = 0
    @total = 0    
    @correct = 0
    @wrong = []
    for question in @survey_questions do

      input = []

      if @counter == 0 and params.has_key?(:question0)
        @input = params[:question0]  
      elsif @counter == 1 and params.has_key?(:question1)
        @input = params[:question1] 
      elsif @counter == 2 and params.has_key?(:question2)
        @input = params[:question2] 
      elsif @counter == 3 and params.has_key?(:question3)
        @input = params[:question3]
      elsif @counter == 4 and params.has_key?(:question4)
        @input = params[:question4]         
      elsif @counter == 5 and params.has_key?(:question5)
        @input = params[:question5]
      elsif @counter == 6 and params.has_key?(:question6)
        @input = params[:question6]
      elsif @counter == 7 and params.has_key?(:question7)
        @input = params[:question7]   
      elsif @counter == 8 and params.has_key?(:question8)
        @input = params[:question8] 
      elsif @counter == 9 and params.has_key?(:question9)
        @input = params[:question9]   
      elsif @counter == 10 and params.has_key?(:question10)
        @input = params[:question10]        
      elsif @counter == 11 and params.has_key?(:question11)
        @input = params[:question11]   
      end       

      if question.survey_type == "Choose_all" or question.survey_type == "Choose_one"
        @total = @total + 1
      end

      @answers = question.survey_correct
      @result = false 
      if @answers != nil and @input != nil 
        @answers = @answers.split(",")
        @result = true 
        for answer in @answers do #all responses must be accounted for
          if not @input.include?(answer) 
            @result = false
          end
        end
        if @input.kind_of?(Array)
          for input in @input do #all responses must be accounted for
            if not @answers.include?(input) 
              @result = false
            end
          end  
        end

      else
        @result = false 
      end

      if @result == true
        @correct = @correct + 1
      else
        @wrong << @counter
      end

      @counter = @counter + 1
    end

    #save the score
    if current_user
      score = SurveyScore.new
      score.survey_id = params[:id]
      score.user_id = current_user.id
      score.survey_score = @correct
      score.save
    end

    render js: "alert('#{@correct} out of #{@total}; errors on questions #{@wrong}')"

  end 

  private

end
