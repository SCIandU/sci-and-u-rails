module Api
  module V1
    class HealthResourceSerializer < ActiveModel::Serializer
      attributes :title, :description, :url, :format, :audience, :tool_type, \
                 :free, :published, :user_id, :department_id, :problem_id, \
                 :solution_category_id, :sponsor_id, :attachment, \
                 :created_at, :updated_at, :for_coaching

      def created_at
        object.created_at.in_time_zone.iso8601 if object.created_at
      end

      def updated_at
        object.updated_at.in_time_zone.iso8601 if object.created_at
      end
    end
  end
end
