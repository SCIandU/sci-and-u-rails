class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Thank you for your question!! It's been slated for review by a moderator.  We're looking forward to seeing you at the event!"
      redirect_to "/salon_events/#{@question.salon_event_id}"
    else
      render 'new'
    end
  end

  private

  def question_params
    params.require(:question).permit(:user_id, :salon_event_id, :userquestion)
  end
end
