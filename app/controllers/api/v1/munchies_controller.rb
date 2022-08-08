module Api
  module V1
    class MunchiesController < ApplicationController
      def search
        if params[:location] && params[:food]
          location = MapFacade.get_coords(params[:location])
          if location != "error"
            restaurant = MunchiesFacade.get_restaurant(params[:location], params[:food])
            weather = WeatherFacade.get_weather(location)
            render json: Api::V1::MunchiesController::MunchiesSerializer.serialize_munchies(restaurant, weather)
          else
            render status: 404
          end
        else
          render status: 404
        end
      end
    end
  end
end
