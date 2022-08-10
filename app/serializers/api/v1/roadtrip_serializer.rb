module Api
  module V1
    class RoadtripSerializer
      def self.serialize_roadtrip(forecast, trip)
        {
          "data": {
            "id": "null",
            "type": "roadtrip",
            "attributes": {
              "start_city": trip.origin,
              "end_city": trip.destination,
              "travel_time": trip.travel_time,
              "weather_at_eta": {
                "temperature": forecast.temperature,
                "conditions": forecast.conditions
              }
            }
          }
        }
      end
    end
  end
end
