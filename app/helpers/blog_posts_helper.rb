module BlogPostsHelper
	def content_helper
		@blog_post.content.split("\n")
	end

	def index_content_helper
		blog_post.content.split("\n")
	end	

	def full_name_helper
		"#{@blog_post.user.first_name} #{@blog_post.user.last_name}"
	end
end
