module Api
  module V1
    class UsersController < ApplicationController
      def create
        @validation = User.validate_user(user_params)

        if @validation == "Validated"
          new_user = User.create(user_params)
          new_user.update(api_key: :"#{SecureRandom.hex}")
          render json: Api::V1::UserSerializer.serialize_user(new_user), status: 201
        elsif @validation == "Password does not match password confirmation"
          render json: { error: "#{@validation}" }, status: 404
        elsif @validation == "No password provided"
          render json: { error: "#{@validation}" }, status: 404
        elsif @validation == "No email provided"
          render json: { error: "#{@validation}" }, status: 404
        elsif @validation == "Email has already been registered"
          render json: { error: "#{@validation}" }, status: 404
        else
          render json: { error: "An unknown error has occurred" }, status: 404
        end
      end

    private
      def user_params
        params.permit(:email, :password, :password_confirmation)
      end
    end
  end
end
