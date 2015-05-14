class Student
  attr_reader :name

  def initialize(first, last)
    @name = "#{first} #{last}"
    @courses = []
  end

  def courses
    @courses
  end

  def enroll(course)
    unless @courses.include?(course)
      @courses << course
      course.add_student(self)
    end
  end

  def course_load
    result = Hash.new(0)
    courses.each do |course|
      result[course.department] += course.num_credits
    end
    result.inspect
  end
end


class Course
  attr_reader :students, :department, :num_credits

  def initialize(name, department, num_credits)
    @name = name
    @department = department
    @num_credits = num_credits
    @students = []
  end

  def add_student(student)
    @students << student
  end

end
