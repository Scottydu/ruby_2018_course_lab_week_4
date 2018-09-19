class Api::V1::MeController < ApplicationController
  before_action :require_login

  def index
    render json: current_user, serializer: Api::V1::UserSerializer
  end
end
