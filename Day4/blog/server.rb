require	'sinatra'
require 'haml'
require 'sinatra/reloader' if development?
require './lib/post.rb'
require './lib/blog.rb'
require 'pry'

set :haml, format: :html5
enable(:sessions)

blog = Blog.new
blog.add_post(Post.new("El Atlético elimina al Barcelona", "El
 despliegue físico rojiblanco sobrepasó a los culés: los
 locales hicieron 114,578 kilómetros por los 102,578 de los
  visitantes. Messi, el que menos corrió de los 22 titulares.",
                       'sports', "Alfonso J. Díaz"))
blog.add_post(Post.new("Nadal sigue con su mejoría: venció
 a Thiem con solvencia", "El tenista español dio otro paso
 adelante en el Masters 1.000 de Montecarlo al vencer al
 complicado Dominic Thiem, por 7-5 y 6-3.", 'sports', "Anónimo"))

get('/') do
  redirect to('/index')
end

get('/index') do
  @posts = blog.posts
  @last_posts = blog.last_posts
  haml(:index)
end

get('/post_details/:post_id') do
  @posts = blog.posts
  @id = params[:post_id]
  haml(:post_details)
end

get '/new_post' do
  haml(:new_post)
end

post '/publish_post' do
  title = params[:title]
  text = params[:text]
  category = params[:category]
  author = params[:author]
  blog.add_post(Post.new(title, text, category, author))
  redirect to('/index')
end

# get '/' do
#   if session[:name].nil?
#     redirect to('/index')
#   else
#     redirect to('/profile')
#   end
# end
#
# get '/delete' do
#   session.clear
#   redirect to('/index')
# end
#
# get '/index' do
#   haml(:index)
# end
#
# get '/profile' do
#   @name = session[:name]
#   @year = session[:year]
#   @email = session[:email]
#   @country = session[:country]
#   @exp = session[:exp]
#   @age = Age.calculate(@year)
#   @course = session[:course]
#   haml(:profile)
# end
#
# get '/profile/register' do
#   haml(:profile_register)
# end
#
# post '/profile/save_register' do
#   @name = params[:name]
#   @year = params[:year]
#   @email = params[:email]
#   @country = params[:country]
#   @exp = params[:exp]
#   @age = Age.calculate(@year)
#   if session[:age] == @age && session[:name] == @name
#     @already_registered = true
#   else
#     session[:age] = @age
#     session[:name] = @name
#     session[:email] = @email
#     session[:country] = @country
#     session[:exp] = @exp
#   end
#   redirect to '/profile'
# end
#
# get '/courses' do
#   @exp = session[:exp]
#   @courses = ironhack_courses.courses
#   haml(:courses)
# end
#
# get '/courses/join/:id' do
#   id = params[:id].to_i
#   session[:course] = ironhack_courses.find_course_by_id(id)
#   redirect to '/profile'
# end
# =
