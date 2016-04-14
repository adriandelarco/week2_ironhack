# Hold the courses collection
class Courses
  attr_accessor :courses
  def initialize
    @courses = []
  end

  def add_course(course)
    @courses.push(course)
  end

  def find_course_by_id(id)
    @courses.find { |course| course.id == id }
  end
end
