module Api
  module V1
    class ScriptsAndTipsController < Api::V1::BaseController
      skip_before_action :authenticate_user!, raise: false

      def index
        script = params['script']
        session = params['session_num'].to_i
        repeat = params['repeat']
        department_id = params['department_id']
        us_script = params['us']
        final_script = ''
        
        if us_script == 'true'  
          #loading the prefix and suffix
          client = params['client']
          coach = params['coach']
          query = {}
          query[:id] = department_id.to_i
          department = Department.find(query[:id])      
          query = {}
          query[:solution_category_id] = 13 #USA script (there is only one)
          if script == 'true' 
            temporary = ScriptsAndTip.where(query).select("id","repeat_script","script")  
            script = temporary[0].script 
            repeat = temporary[0].repeat_script
 
            if (department.name == 'Goals')
              script.gsub! 'INSERT_TOPIC_NAME', 'Goal Setting'
            elsif (department.name == 'Problems')
              script.gsub! 'INSERT_TOPIC_NAME', 'Problem Solving'
            elsif (department.name == 'HealthInfo')
              script.gsub! 'INSERT_TOPIC_NAME', 'Evaluating Health Information'
            elsif (department.name == 'HealthcareTeams')
              script.gsub! 'INSERT_TOPIC_NAME', 'Building Your Healthcare Team'
            elsif (department.name == 'Communication')
              script.gsub! 'INSERT_TOPIC_NAME', 'Communication With Healthcare Providers'
            else
              script.gsub! 'INSERT_TOPIC_NAME', department.name
            end

            if not client.nil? && client != 0
              script.gsub! 'INSERT_CLIENT_NAME', client
            end
            if not coach.nil? && coach != 0
              script.gsub! 'INSERT_COACH_NAME', coach
            end
          end  
          render json: {:script => script, :final_script => repeat }, each_serializer: ScriptsAndTipSerializer
        else
          #loading the prefix and suffix
          query = {}
          query[:solution_category_id] = 32 #Introduction department contains prefix and middle
          newparams = {}
          newparams[:id] = department_id.to_i
          department = Department.find(newparams[:id])
          if script == 'true' and newparams[:id] != 13  
            temporary = ScriptsAndTip.where(query).select("id","repeat_script","script")  
            middle = temporary[0].repeat_script
            prefix = temporary[0].script 
            prefix.gsub! 'INSERT_TOPIC_NAME', department.name
          end    
          if script == 'true' and prefix     
            final_script = final_script + prefix + "<p></p>" 
          end

          #script content
          flag = false #says this is the intro
          query = {}
          query[:department_id] = department_id.to_i unless department_id.nil?
          if query[:department_id] == 13
            flag = true
          end        
          if script == 'true' and flag #first script
            query[:department_id] = 5 #SCI and U department for first script
            scripts_and_tip = ScriptsAndTip.where(query).select("id","script") 
            scripts_and_tip = scripts_and_tip[0].script
          elsif script == 'true' and repeat == 'true'
            scripts_and_tip = ScriptsAndTip.where(query).select("id","repeat_script") 
            scripts_and_tip = scripts_and_tip[0].repeat_script
          elsif script == 'true' and repeat == 'false'
            scripts_and_tip = ScriptsAndTip.where(query).select("id","script") 
            scripts_and_tip = scripts_and_tip[0].script
          else
            scripts_and_tip = ScriptsAndTip.where(query).select("id","tip") 
            scripts_and_tip = scripts_and_tip[0].tip
          end


          if script == 'true' and scripts_and_tip and flag == false
            final_script = final_script + "<span class='blue'>" + scripts_and_tip + "</span><p></p>"
          elsif script == 'true' and scripts_and_tip and flag
            final_script = scripts_and_tip + "<p></p>"
          end

          #subtopic content
          query = {}
          if session > 1 and session < 7 
            query[:solution_category_id] = 33 + session - 2;
            newparams = {}
            newparams[:id] = query[:solution_category_id]
            solution = SolutionCategory.find(newparams[:id])
            if script == 'true' and repeat == 'true'
              subtopic_script = ScriptsAndTip.where(query).select("id","repeat_script")
              subtopic_script = subtopic_script[0].repeat_script
            elsif script == 'true' and repeat == 'false'
              subtopic_script = ScriptsAndTip.where(query).select("id","script") 
              subtopic_script = subtopic_script[0].script
            end
          end 
          if subtopic_script and middle and script == 'true' and query[:department_id] != 5 
            middle.gsub! 'INSERT_SUBTOPIC_HERE', solution.name
            final_script = final_script + middle + "<p></p><span class='blue'>" + subtopic_script + "</span><p></p>"
          end

          query = {}
          query[:department_id] = 6 #Health Management Basics for script suffix
          if script == 'true' and repeat == 'true'        
            suffix = ScriptsAndTip.where(query).select("id","repeat_script") 
            suffix = suffix[0].repeat_script          
          elsif script == 'true' and repeat == 'false'
            suffix = ScriptsAndTip.where(query).select("id","script")   
            suffix = suffix[0].script
          end   
          if script == 'true' and suffix and flag == false
            final_script = final_script + suffix
          end
          render json: {:script => scripts_and_tip, :final_script => final_script }, each_serializer: ScriptsAndTipSerializer
        end
      end

      def show
        script = params['scripts']
        query = {}
        query[:id] = params[:id]
        if script == 'true'
          scripts_and_tip = ScriptsAndTip.where(query).select("id","script") 
        else
          scripts_and_tip = ScriptsAndTip.where(query).select("id","tip") 
        end
        render json: {:script => scripts_and_tip }, each_serializer: ScriptsAndTipSerializer
      end
    end
  end
end
