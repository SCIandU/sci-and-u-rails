module Api
  module V1
    class SalonEventsController < Api::V1::BaseController
      skip_before_action :authenticate_user!, raise: false
      def index
        salon_events = SalonEvent.all
        render json: salon_events, each_serializer: SalonEventSerializer
      end

      def show
        salon_event = SalonEvent.find(params[:id])
        render(json: Api::V1::SalonEventSerializer.new(salon_event).to_json)
      end
    end
  end
end
