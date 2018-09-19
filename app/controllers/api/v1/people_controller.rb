class Api::V1::PeopleController < ApplicationController
  def show
    @person = Person.find(params[:id])
    render json: @person, serializer: Api::V1::PersonSerializer
  end
end
