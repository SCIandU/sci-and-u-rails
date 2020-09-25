class BlogPostsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit]
  before_action :update_total_page_views, only: :show

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)
    @blog_post.user_id = current_user.id
    if @blog_post.save
      redirect_to blog_post_path(@blog_post)
    else
      render 'new'
    end
  end

  def show
    @blog_post = BlogPost.find(params[:id])
    @blog_comment = BlogComment.new
    @blog_comments = @blog_post.blog_comments
    @user = @blog_post.user
    @sponsor = @blog_post.sponsor
    impressionist(@blog_post) #message is optional
  end

  def index
    @blog_posts= BlogPost.paginate(:page => params[:page], :per_page => 3)  
    if params[:department_id]
      @other_blog_posts = BlogPost.where('department_id = ' + params[:department_id])
      @blog_posts = @other_blog_posts.paginate(:page => params[:page], :per_page => 3)
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

  def blog_post_params
    params.require(:blog_post).permit(
      :title,
      :user_id,
      :content,
      :department_id,
      :image_url,
      :sponsor_id
    )
  end



end
