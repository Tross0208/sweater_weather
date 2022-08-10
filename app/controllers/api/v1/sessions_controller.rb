module Api
  module V1
    class SessionsController < ApplicationController
      def create
        user = User.find_by(email: session_params[:email])
        if user && user.authenticate(session_params[:password])
          render json: Api::V1::UserSerializer.serialize_user(user), status: 200
        else
          render json: {error: "Invalid Credentials"}, status: 404
        end
      end

      private
        def session_params
          params.permit(:email, :password)
        end
    end
  end
end
