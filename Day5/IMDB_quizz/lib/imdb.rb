# Define the blog object and its logic
require 'rubygems'
require 'imdb'
require 'pry'

class Imdb_movies
  attr_accessor :movies
  def initialize
    @movies = []
  end

  def search(title)
    search = Imdb::Search.new(title)
    @search = []
    (0..25).each do |number|
      @search << [search.movies[number..number].collect(&:poster), search.movies[number..number].collect(&:title)]
    end
    obtain_movies
  end

  def fake_search(fake_array_search)
    @search = fake_array_search
    obtain_movies
  end

  def obtain_movies
    i = 0
    (0..8).each_with_index do |_movie, index|
      index += i
      movie_poster = @search[index][0]
      movie_title = @search[index][1]
      i = 0
      while movie_poster[0].nil?
        i += 1
        movie_poster = @search[index + i][0]
        movie_title = @search[index + i][1]
      end
      @movies << [movie_poster, movie_title]
    end
  end
end
