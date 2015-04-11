#!/home/kris/.rvm/wrappers/ruby-2.2.0/ruby

class Student
  attr_accessor :brain, :conspect

  def learn_subject(teach_material)
    self.conspect_something(teach_material)
    self.teach_material
    self.pass_exam(teach_material)
  end

  def pass_exam(teach_material)
    puts "Mark of the #{self.class.to_s} is #{((brain.size*5) / teach_material.size.to_f).round(2)}"
  end
end

class ExcellentStudent < Student
  def conspect_something(teach_material)
    @conspect = teach_material
  end

  def teach_material
    @brain = @conspect[0..@conspect.size*0.95]
  end
end

class BadStudent < Student
  def conspect_something(teach_material)
    @conspect = teach_material[0..(teach_material.size*0.5)]
  end

  def teach_material
    @brain = @conspect[0..@conspect.size*0.5]
  end
end

puts 'Set knowledge:'
knowledge = gets
bad_student = BadStudent.new
excellent_student = ExcellentStudent.new
bad_student.learn_subject(knowledge)
excellent_student.learn_subject(knowledge)
