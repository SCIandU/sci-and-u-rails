class SolutionCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :update_total_page_views, only: :show  

  def show
    @solution_category = SolutionCategory.find(params[:id])
    @department = @solution_category.department
    if @department.id == 1
      @basic_page = BasicPage.find(25)
    elsif @department.id == 2
      @basic_page = BasicPage.find(23)
    elsif @department.id == 3
      @basic_page = BasicPage.find(26)
    elsif @department.id == 4
      @basic_page = BasicPage.find(24)
    end
    @stories = @department.stories
    @salon_events = @department.salon_events
    @blog_posts = @department.blog_posts
    @solution_categories = @department.solution_categories
    @problems = @department.problems
    @health_resources = @solution_category.health_resources.includes(:reviews)
    impressionist(@solution_category)
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

end
