require 'sinatra'
require 'sinatra/reloader' if development?
require 'haml'
require "./apps/calculator.rb"

set :haml,:format => :html5

get '/' do
	@file = IO.read('./public/result.txt')
	haml(:index)
end

post '/result' do
	first = params[:first_number]
	second = params[:second_number]
	operation = params["operation"]
	calc = Calculate.new(first,second)
	@result = calc.select_operation(operation)
 	haml(:result)
end

post '/save_result' do
	IO.write('./public/result.txt', params[:result])
	redirect to('/')
end

get '/add' do
	haml(:add)
end

get '/substract' do
	haml(:substract)
end

get '/multiply' do
	haml(:multiply)
end

get '/divide' do
	haml(:divide)
end

post "/calculate_add" do
  first = params[:first_number]
  second = params[:second_number]
  calc = Calculate.new(first,second)
  result = calc.add
  "#{result}"
end

post "/calculate_substract" do
  first = params[:first_number]
  second = params[:second_number]
  calc = Calculate.new(first,second)
  result = calc.substract
  "#{result}"
end

post "/calculate_multiply" do
  first = params[:first_number]
  second = params[:second_number]
  calc = Calculate.new(first,second)
  result = calc.multiply
  "#{result}"
end

post "/calculate_divide" do
  first = params[:first_number]
  second = params[:second_number]
  calc = Calculate.new(first,second)
  result = calc.divide
  "#{result}"
end