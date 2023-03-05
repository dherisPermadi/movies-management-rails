class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show update destroy]

  def index
    movies = Movie.ransack(params[:q])
                  .result
                  .order(title: :asc)
                  .page(params[:page] || 1)
                  .per(params[:per_page] || 10)
    json_response(movies)
  end

  def show
    @movie ? json_response(@movie) : validate_response('Data not found!')
  end

  def create
    movie = Movie.new(movie_params)

    if movie.save
      json_response(movie)
    else
      validate_response(movie.errors.full_messages.to_sentence)
    end
  end

  def update
    if @movie.update(movie_params)
      json_response(@movie)
    else
      validate_response(@movie.errors.full_messages.to_sentence)
    end
  end

  def destroy
    @movie.destroy

    message_response('Delete Movie success!')
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie)
          .permit(:title, :description, :rating, :image)
  end
end
