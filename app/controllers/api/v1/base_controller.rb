module Api
  module V1
    class BaseController < ApplicationController
      include DeviseTokenAuth::Concerns::SetUserByToken
      protect_from_forgery with: :null_session

      # protect_from_forgery with: :null_session, if: proc { |c| c.request.format == 'application/json' }
      before_action :destroy_session
      def destroy_session
        request.session_options[:skip] = true
      end
    end
  end
end
