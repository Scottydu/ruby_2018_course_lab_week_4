class Api::V1::MoviesController < ApplicationController
  def index
    @movies = Movie.all
    render json: @movies, each_serializer: Api::V1::MovieSerializer
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      render json: @movie, serializer: Api::V1::MovieSerializer, status: :created
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  def show
    @movie = Movie.find(params[:id])
    render json: @movie, serializer: Api::V1::MovieSerializer
  end

  private

  def movie_params
    params.permit(:name, :year)
  end
end
