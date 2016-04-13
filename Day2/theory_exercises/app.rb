require 'sinatra'
require 'sinatra/reloader' if development?
require 'haml'

set :haml,:format => :html5

get '/hours/ago/:hours' do
	@hours = Time.now - params[:hours].to_i * 60 * 60
	haml(:hours_ago)
end

get '/puertas/:name/:year' do
	@name = params[:name]
	@age = (Time.now.strftime "%Y").to_i - params[:year].to_i
	haml(:puertas)
end

get	'/' do
	@now = DateTime.now
	haml(:index)
end

get	'/erb' do
	@now = DateTime.now
	haml(:index)
end

get	'/otro' do
	"Lo que sea pero otro"
end

get '/hi' do
	"Hello world. \n\n Ola k ase."
end

get '/:id1/:id2' do
	@id1 = params[:id1]
	@id2 = params[:id2]
	haml(:index)
end