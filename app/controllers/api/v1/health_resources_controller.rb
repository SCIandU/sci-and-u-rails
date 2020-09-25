module Api
  module V1
    class HealthResourcesController < Api::V1::BaseController
      skip_before_action :authenticate_user!, raise: false
      def index
        department_id = params['department_id']
        
        login = params['login']                
        hrquery = {}
        hrquery[:department_id] = department_id.to_i unless department_id.nil?
        if (params['us'])
          hrquery[:us] = true
        else 
          hrquery[:for_coaching] = true
        end
        health_resources = HealthResource.where(hrquery).select("id, department_id, title, description, url, attachment, updated_at").sort_by(&:updated_at).reverse!      
        if (department_id)
          tipquery = {}
          tipquery[:department_id] = department_id.to_i unless department_id.nil?
          scripts_and_tips = ScriptsAndTip.where(tipquery).select("tip, updated_at").sort_by(&:updated_at).reverse!          
          render json: {:health_resources => health_resources, :tips => scripts_and_tips }, each_serializer: HealthResourceSerializer
        else 
          if (login)
            query = {}
            query[:login] = login
            sessionuser = User.where(query).first
            output = []
            faves = []
            query = {}
            if (sessionuser) 
              health_resources_user = sessionuser.favorites
              favoritelist = health_resources_user.reject { |c| c.session != nil } 
              health_resources_user = health_resources_user.reject { |c| c.session == nil } 
              health_resources_user.each { |x| 
                query[:id] = x.health_resource_id
                output.push(HealthResource.where(query).select("id, department_id, title, description, url, attachment"))     
              }
              favoritelist.each { |x| 
                query[:id] = x.health_resource_id
                faves.push(HealthResource.where(query).select("id, department_id, title, description, url, attachment"))     
              }              
            end            
            render json: {:health_resources => health_resources, :health_resources_user => output,  :health_resources_faves => faves}, each_serializer: HealthResourceSerializer
          else
            render json: {:health_resources => health_resources, :health_resources_user => "",  :health_resources_faves => "" }, each_serializer: HealthResourceSerializer
          end
        end

      end

      def show
        health_resource = HealthResource.find(params[:id])
        render(json: Api::V1::HealthResourceSerializer.new(health_resource).to_json)
      end
    end
  end
end
