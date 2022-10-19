class MoviesController < ApplicationController
  def index
    @movies = Movie.order(id: :asc)
  end
end
