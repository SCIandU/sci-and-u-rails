module Api
  module V1
    class SurveySerializer < ActiveModel::Serializer
      attributes :name, :description, :survey_total

      belongs_to :department
      has_many :survey_questions      

      def created_at
        object.created_at.in_time_zone.iso8601 if object.created_at
      end

      def updated_at
        object.updated_at.in_time_zone.iso8601 if object.created_at
      end
    end
  end
end
