# Define the courses
class Course
  attr_reader :exp, :id, :name
  def initialize(exp, id, name)
    @exp = exp
    @id = id
    @name = name
  end
end
