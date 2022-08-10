module Api
  module V1
    class ForecastsController < ApplicationController
      def search
        if params[:location]
          location = MapFacade.get_coords(params[:location])
          weather = WeatherFacade.get_weather(location)
          render json: Api::V1::ForecastsController::ForecastSerializer.forecast_index_serializer(weather)
        else
          render status: 404
        end
      end
    end
  end
end
