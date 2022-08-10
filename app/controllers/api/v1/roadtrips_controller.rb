module Api
  module V1
    class RoadtripsController < ApplicationController
      def create
        user = User.find_by(api_key: roadtrip_params[:api_key])
        if user
          trip = MapFacade.get_trip(roadtrip_params[:origin], roadtrip_params[:destination])
          forecast = WeatherFacade.get_destination_weather(trip)
          render json: Api::V1::RoadtripSerializer.serialize_roadtrip(forecast, trip)
        end 
      end
      private
        def roadtrip_params
          params.permit(:origin, :destination, :api_key)
        end
    end
  end
end
