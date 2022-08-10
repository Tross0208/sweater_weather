module Api
  module V1
    class UsersController < ApplicationController
      def create

        if User.validate_user(user_params)
          new_user = User.create(user_params)
          render status: 201
        else
          render status: 404
        end
      end

    private
      def user_params
        params.permit(:email, :password, :password_confirmation)
      end
    end
  end
end
