#!/home/kris/.rvm/wrappers/ruby-2.2.0/ruby

class Student
  attr_accessor :info

  def initialize(info)
    @info = info
  end

  def do_my_work
    false
  end
end

class StudentPR < Student
  attr_accessor :programming_knowlage

  def do_my_work
    eval @programming_knowlage
  end
end

class Teacher
  attr_accessor :subject, :info

  def give_knowlage(student)
    false
  end
end

class ProgrammingTeacher < Teacher
  attr_accessor :programming_knowlage

  def initialize(info, knowlage)
    @info = info
    @subject = 'Patterns'
    @programming_knowlage = knowlage
  end

  def give_knowlage(student)
    student.programming_knowlage = @programming_knowlage
  end
end

p 'Give student info:'
student = StudentPR.new(gets)
teacher = ProgrammingTeacher.new('Kondratyuk Evgen', %q|3.times{ puts 'Hello world' }|)

p "Teacher #{teacher.info} teach student #{student.info}..."
teacher.give_knowlage(student)
sleep 2
p 'Student is traind successfully!'
sleep 2
p 'Student do what he/she studied:'
student.do_my_work
