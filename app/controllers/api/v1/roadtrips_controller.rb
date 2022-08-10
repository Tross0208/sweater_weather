module Api
  module V1
    class RoadtripsController < ApplicationController
      def create
        user = User.find_by(email: session_params[:email])

      private
        def roadtrips_params
          params.permit
        end
    end
  end
end
