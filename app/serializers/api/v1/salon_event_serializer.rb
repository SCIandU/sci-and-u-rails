module Api
  module V1
    class SalonEventSerializer < ActiveModel::Serializer
      attributes :title, :description, :event_date, :url, :archive_link, \
                 :organizational_affiliation, :podcast, :duration, \
                 :published, :department_id, \
                 :sponsor_id, :attachment, \
                 :created_at, :updated_at

      def created_at
        object.created_at.in_time_zone.iso8601 if object.created_at
      end

      def updated_at
        object.updated_at.in_time_zone.iso8601 if object.created_at
      end
    end
  end
end
