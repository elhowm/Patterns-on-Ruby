#!/home/kris/.rvm/wrappers/ruby-2.2.0/ruby
require 'faker'

class Student
  attr_accessor :name, :skill, :friend, :number

  def initialize(number, name, skill, next_student_link = nil)
    @number, @name, @skill, @friend = number, name, skill, next_student_link
  end

  def make_you_or_your_friend(action)
    if action == skill
      self.make_something
    else
      if @friend.nil?
        p %q|I and my friends can't do it|
      else
        @friend.make_you_or_your_friend action
      end
    end
  end

  def make_something
    p %|Hi, I'm #{name} №#{number}|
    p %|I'm make #{skill} program|
  end
end

class Group
  attr_accessor :name, :students

  def initialize(name, students_count)
    skills = ['Ruby', 'C++', 'C#', 'PHP', 'Basic', 'Python', 'Pascal']
    @name = name
    @students = []
    students_count.times do |i|
      @students.push Student.new(i, Faker::Name.name, skills[i%7], @students.last)
    end
  end
end

PR112 = Group.new('PR112', 21)
p %q|Tell what you want to student do? ('Ruby', 'C++', 'C#', 'PHP', 'Basic', 'Python', 'Pascal')|
PR112.students.last.make_you_or_your_friend(gets.chop)
