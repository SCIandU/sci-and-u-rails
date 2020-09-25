class SponsorsController < ApplicationController
  def index
    @sponsors = Sponsor.all
  end

  def show
    @sponsor = Sponsor.find(params[:id])
    @blog_posts = BlogPost.where('sponsor_id = ?', params[:id])
    @health_resources = @sponsor.health_resources
    @salon_events = @sponsor.salon_events
    @coaches = @sponsor.users
  end
end
