module Api
  module V1
    class UserSerializer
      def self.serialize_new_user(user)
        {
          "data": {
            "type": "users",
            "id": user.id,
            "attributes": {
              "email": user.email,
              "api_key": user.api_key
            }
          }
        }
      end
    end
  end
end
