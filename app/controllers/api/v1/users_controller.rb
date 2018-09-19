class Api::V1::UsersController < ApplicationController
  def create
    service = UserCreation.new(user_params)
    if service.call
      render json: { auth_token: service.auth_token }
    else
      render json: { errors: service.errors }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
