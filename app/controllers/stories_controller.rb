class StoriesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit]
  before_action :update_total_page_views, only: [:show, :index]  

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      redirect_to story_path(@story)
    else
      render 'new'
    end
  end

  def show
    @story = Story.find(params[:id])
    imprssionist(@story)
  end

  def index
    @stories= Story.paginate(:page => params[:page], :per_page => 6)  
    if params[:department_id]
      @other_stories = Story.where('department_id = ' + params[:department_id])
      @stories = @other_stories.paginate(:page => params[:page], :per_page => 6)
    end  
  end

  def edit; end

  def update; end

  private

  def update_total_page_views
    if current_user.total_time_online
      result = current_user.total_time_online + 1
    else
      result = 1
    end
    current_user.update_attributes(:total_time_online => result)
  end

  def story_params
    params.require(:story).permit(
      :title,
      :user_id,
      :department_id,
      :image,
      :youtube_link,
      :sponsor_id
    )
  end
end
