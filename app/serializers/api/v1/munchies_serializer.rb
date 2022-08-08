module Api
  module V1
    class MunchiesSerializer
      def self.serialize_munchies(restaurant, weather)
        {
          "data": {
            "id": "null",
            "type": "munchie",
            "attributes": {
              "destination_city": restaurant.city,
              "forecast": {
                "summary": weather[:current].conditions,
                "temperature": weather[:current].temperature.to_s
              },
              "restaurant": {
                "name": restaurant.name,
                "address": restaurant.address
              }
            }
          }
        }
      end
    end
  end
end
