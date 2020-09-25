class DepartmentsController < ApplicationController
  before_filter :authenticate_user!
  before_action :update_total_page_views, only: :show  
  
  def show
    @department = Department.find(params[:id])
    sort = params[:sort]
    if sort
      @health_resources = @department.health_resources.order(title: :desc) \
        if sort == 'alphabet_desc'
      @health_resources = @department.health_resources.order(:title) \
        if sort == 'alphabet_asc'
    else
      @health_resources = @department.health_resources
    end
    @stories = @department.stories
    @solution_categories = @department.solution_categories
    @problems = @department.problems
    @salon_events = @department.salon_events
    @blog_posts = @department.blog_posts
    @users = User.where('role = 2')
    impressionist(@department) 
  end

  private

  def update_total_page_views
    if current_user.total_time_online
      result = current_user.total_time_online + 1
    else
      result = 1
    end
    #puts("result -->")
    #puts(result)
    attributes = {:total_time_online => result}
    current_user.update_attributes(attributes)
  end

end
