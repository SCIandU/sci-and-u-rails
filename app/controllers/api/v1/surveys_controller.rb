module Api
  module V1
    class SurveysController < Api::V1::BaseController
      skip_before_action :authenticate_user!, raise: false

      def index
        department_id = params['department_id']
        query = {}
        query[:department_id] = department_id.to_i unless department_id.nil?
        surveys = Survey.where(query)        
        render json: survey, each_serializer: SurveySerializer
      end

      def show
        survey = Survey.find(params[:id])
        render(json: Api::V1::SurveySerializer.new(survey).to_json)
      end
    end
  end
end
