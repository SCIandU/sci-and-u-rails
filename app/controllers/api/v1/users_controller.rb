module Api
  module V1
    class UsersController < Api::V1::BaseController
      before_action :authenticate_user!

      def index
        #unless current_user.allow_api_access
        #  render json: {}, status: 401
        #  return
        #end
        users = User.all
        render json: users, each_serializer: UserSerializer
      end

      def show
        #unless current_user.allow_api_access
        #  render json: {}, status: 401
        #  return
        #end
        #render all the user's "favorites", unless a session is specified (in which case render favorites for that session)
        @show_badges = params[:show_badges]
        if (!@show_badges)
          query = {}        
          query[:session] = params[:session].to_i unless params[:session].nil?          
          @favorites = Favorite.where(query) 
          @resources = []
          @favorites.each do |favorite| 
            @resources << HealthResource.find(favorite.health_resource_id)
          end
          @output = @resources
        else
          @user = User.find(params[:id].to_i)
          @output = @user.badges
          @output.push({"updated" => @user.badge_updated})
          if (@user.badge_updated)
            @user.badge_updated = false
            @user.save
          end
        end
        render(json: @output.to_json)
      end
    end
  end
end
