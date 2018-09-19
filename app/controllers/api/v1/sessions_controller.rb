class Api::V1::SessionsController < ApplicationController
  def create
    auth = AuthenticateUser.new(params[:email], params[:password])
    if auth.call
      render json: { auth_token: auth.auth_token }
    else
      render json: { errors: auth.errors }, status: :unauthorized
    end
  end

  def destroy
  end
end
