class ScriptsAndTipsController < ApplicationController

   	def index
	    script = params['scripts']
	    department_id = params['department_id']
	    solution_category_id = params['solution_category_id']
	    query = {}
	    query[:department_id] = department_id.to_i unless department_id.nil?
	    query[:solution_category_id] = solution_category_id.to_i unless solution_category_id.nil?
	    @scripts_and_tips = ScriptsAndTip.where(query)
	    respond_to do |format|
      if script == 'true'
        format.json { render json: @scripts_and_tips }
      elsif script == 'false'
        format.json { render json: @scripts_and_tips, except: [:script] }
      end
	    end
   	end
   	
end
