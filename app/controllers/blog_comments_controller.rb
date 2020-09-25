class BlogCommentsController < ApplicationController

  def create
    @blog_comment = BlogComment.new(blog_comment_params)
    if @blog_comment.save
      flash[:notice] = 'Thank you for your comment.  '\
                        'After a moderator approves it, '\
                        'it will be added to the blog post below.'
      redirect_to blog_post_path(@blog_comment.blog_post_id)
    else
      render 'new'
    end
  end

  private

  def blog_comment_params
    params.require(:blog_comment).permit(
      :user_id,
      :blog_post_id,
      :comment
    )
  end

end
