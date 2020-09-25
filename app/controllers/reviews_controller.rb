class ReviewsController < ApplicationController
  before_action :find_health_resource, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      flash[:notice] = "Thank you for your review.  After a moderator approves it, it will be added to the resource descirption below."
      redirect_to health_resource_path(@health_resource)
    else
     render 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment, :user_id, :health_resource_id)
  end

  def find_health_resource
    @health_resource = HealthResource.find(params[:health_resource_id])
  end
end
