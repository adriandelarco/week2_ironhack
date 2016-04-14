require File.expand_path('../../lib/blog.rb', __FILE__)
require File.expand_path('../../lib/post.rb', __FILE__)

RSpec.describe '/lib/.blog' do
  it 'adds new posts to the array @posts' do
    blog = Blog.new
    post = Post.new('Title', 'Text', 'category', 'author')
    blog.add_post(post)
    expect(blog.posts).to include(post)
  end
  it 'returns posts ordered by date' do
    blog = Blog.new
    post1 = Post.new('Title', 'Text', 'category', 'author')
    post2 = Post.new('Title2', 'Text2', 'category', 'author')
    blog.add_post(post1)
    blog.add_post(post2)
    expect(blog.last_posts).to eq([post2, post1])
  end
end
