class FavoritesController < ApplicationController

def new
	@favorite = Favorite.new
end

def create
  @favorite = Favorite.new(favorite_params)
 
  if @favorite.save
    redirect_to favorites_path, :notice => "Your entry has been saved." #  
  else
    render "new"
  end
end
 
private
  def favorite_params
    params.require(:favorite).permit(:user, :resource)
  end
end
