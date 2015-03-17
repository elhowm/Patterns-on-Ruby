#!/home/kris/.rvm/wrappers/ruby-2.2.0/ruby
require 'faker'

class Student
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def make_some_shit
    p "Hi dude! I'm #{name}. And I'm make some shit."
  end
end

class Group
  attr_accessor :students

  def initialize(students_count)
    @students = []
    students_count.times{ @students.push Student.new(Faker::Name.name) }
  end

  def get_some_student
    @students[rand(@students.count)]
  end
end

group = Group.new(10)

group.get_some_student.make_some_shit
