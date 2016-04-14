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
