# Define the post object
class Post
  attr_reader :title, :date, :text, :id, :category, :author
  @@id_global = 0
  def initialize(title, text, category, author)
    @@id_global += 1
    @id = @@id_global
    @title = title
    @date = Time.now
    @text = text
    @category = category
    @author = author
  end
end
