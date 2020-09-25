module Api
  module V1
    class ScriptsAndTipSerializer < ActiveModel::Serializer
      attributes :script, :tip, :user_id, :department_id, \
                 :solution_category_id, :created_at, :updated_at

      def created_at
        object.created_at.in_time_zone.iso8601 if object.created_at
      end

      def updated_at
        object.updated_at.in_time_zone.iso8601 if object.created_at
      end
    end
  end
end
