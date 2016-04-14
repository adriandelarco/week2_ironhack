require	'sinatra'
require 'haml'
require 'sinatra/reloader' if development?
require './model/age.rb'
require './model/course.rb'
require './model/courses.rb'
require 'pry'

set :haml, format: :html5
enable(:sessions)

ironhack_courses = Courses.new
cursoios_pro = Course.new(true, 1, 'Advanced iOS development course.')
cursoweb_pro = Course.new(true, 2, 'Advanced web development course.')
cursoios_noob = Course.new(false, 3, 'Beginner iOS development course.')
cursoweb_noob = Course.new(false, 4, 'Beginner web development course.')
ironhack_courses.add_course(cursoios_pro)
ironhack_courses.add_course(cursoweb_pro)
ironhack_courses.add_course(cursoios_noob)
ironhack_courses.add_course(cursoweb_noob)

get '/' do
  if session[:name].nil?
    redirect to('/index')
  else
    redirect to('/profile')
  end
end

get '/delete' do
  session.clear
  redirect to('/index')
end

get '/index' do
  haml(:index)
end

get '/profile' do
  @name = session[:name]
  @year = session[:year]
  @email = session[:email]
  @country = session[:country]
  @exp = session[:exp]
  @age = Age.calculate(@year)
  @course = session[:course]
  haml(:profile)
end

get '/profile/register' do
  haml(:profile_register)
end

post '/profile/save_register' do
  @name = params[:name]
  @year = params[:year]
  @email = params[:email]
  @country = params[:country]
  @exp = params[:exp]
  @age = Age.calculate(@year)
  if session[:age] == @age && session[:name] == @name
    @already_registered = true
  else
    session[:age] = @age
    session[:name] = @name
    session[:email] = @email
    session[:country] = @country
    session[:exp] = @exp
  end
  redirect to '/profile'
end

get '/courses' do
  @exp = session[:exp]
  @courses = ironhack_courses.courses
  haml(:courses)
end

get '/courses/join/:id' do
  id = params[:id].to_i
  session[:course] = ironhack_courses.find_course_by_id(id)
  redirect to '/profile'
end
