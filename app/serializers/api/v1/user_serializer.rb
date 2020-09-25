module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      attributes :email, :first_name, :last_name, :job_title, :blurb, \
                 :location, :role, :age, :injury_level, \
                 :organizational_affiliations, :sponsor_id, :coach_id, \
                 :coach_status, :skypehandle, :attachment, :approved, \
                 :profile_image, :is_research_participant, :how, :read_form, \
                 :orientation, :with_sci, :total_time_online, :dob, \
                 :whyhere, :injury_date, :gender, :uid
                 
      def created_at
        object.created_at.in_time_zone.iso8601 if object.created_at
      end

      def updated_at
        object.updated_at.in_time_zone.iso8601 if object.created_at
      end
    end
  end
end
