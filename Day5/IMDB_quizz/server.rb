require	'sinatra'
require 'haml'
require 'sinatra/reloader' if development?
require './lib/imdb.rb'
require 'pry'
require 'rubygems'

set :haml, format: :html5
enable(:sessions)

get('/') do
  redirect to('/index')
end

get('/index') do
  haml(:index)
end

post('/movies') do
  search_term = params[:search_term]
  imdb = Imdb_movies.new
  imdb.search(search_term)
  @movies = imdb.movies
  haml(:movies)
end
