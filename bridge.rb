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
  attr_accessor :programming_knowledge

  def do_my_work
    eval @programming_knowledge
  end
end

class Teacher
  attr_accessor :subject, :info

  def give_knowledge(student)
    false
  end
end

class ProgrammingTeacher < Teacher
  attr_accessor :programming_knowledge

  def initialize(info, knowlage)
    @info = info
    @subject = 'Patterns'
    @programming_knowledge = knowlage
  end

  def give_knowledge(student)
    student.programming_knowledge = @programming_knowledge
  end
end

puts 'Give student info:'
student = StudentPR.new(gets)
teacher = ProgrammingTeacher.new('Kondratyuk Evgen', %q|3.times{ puts 'Hello world' }|)

puts "Teacher #{teacher.info} teach student #{student.info}..."
teacher.give_knowledge(student)
sleep 2
puts 'Student is trained successfully!'
sleep 2
puts 'Student do what he/she studied:'
student.do_my_work
