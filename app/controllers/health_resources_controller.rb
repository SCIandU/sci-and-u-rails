class HealthResourcesController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  before_filter :find_health_resource, only: [:show, :edit, :update]
  before_filter :find_department, only: [:new, :create, :edit, :update]
  before_action :update_total_page_views, only: :show

  def new
    @health_resource = HealthResource.new
  end

  def create
    @health_resource = HealthResource.new(health_resource_params)
    @health_resource.department_id = @department.id
    if @health_resource.save
      redirect_to home_thank_you_url
    else
      render 'new'
    end
  end

  def show
    @health_resource = HealthResource.find(params[:id])
    @sponsor = @health_resource.sponsor
    @is_favorite=false
    if current_user.favorite_resources.include? @health_resource
      @is_favorite=true
    end

    raise ActiveRecord::RecordNotFound unless @health_resource.published
    impressionist(@health_resource)
  end

  # Add and remove favorite resources
  # for current_user
  def favorite
    @health_resource = HealthResource.find(params[:id])

    if current_user.favorite_resources.include? @health_resource
      current_user.favorite_resources.delete(@health_resource)
    else
      current_user.favorite_resources << @health_resource
    end
  end  

  def edit; end

  def update
    if @health_resource.update_attributes(health_resource_params)
      redirect_to health_resource_path(@health_resource)
    else
      render 'new'
    end
  end

  def index
    @health_resources = HealthResource.all
    respond_to do |format|
      format.json { render json: @health_resources }
    end    
  end

  # def destroy
  # end

  private

  def update_total_page_views
    if current_user.total_time_online
      result = current_user.total_time_online + 1
    else
      result = 1
    end
    current_user.update_attributes(:total_time_online => result)
  end

  def find_health_resource
    @health_resource = HealthResource.find(params[:id])
  end

  def health_resource_params
    params.require(:health_resource).permit(
      :title,
      :description,
      :url,
      :format,
      :audience,
      :tool_type,
      :free,
      :screenshots,
      :user_id,
      :department_id,
      :problem_id,
      :attachment,
      :solution_category_id
    )
  end

  def find_department
    @department = Department.find(params[:department_id])
  end
end
