# Define the blog object and its logic
class Blog
  attr_accessor :posts
  def initialize
    @posts = []
  end

  def add_post(post)
    @posts.push(post)
  end

  def last_posts
    @posts.sort { |post1, post2| post2.date <=> post1.date }
  end
end
