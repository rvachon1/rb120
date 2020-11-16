class Student

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(object)
    grade > object.grade
  end

  protected

  def grade
    @grade
  end

end

joe = Student.new("joe", 10)
bob = Student.new("bob", 5)
puts "Well done!" if joe.better_grade_than?(bob)
