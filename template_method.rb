#!/home/kris/.rvm/wrappers/ruby-2.2.0/ruby

class Student
  attr_accessor :brain, :conspect

  def learn_subject(teach_matterial)
    self.conspect_something(teach_matterial)
    self.teach_matterial
    self.pass_exam(teach_matterial)
  end

  def pass_exam(teach_matterial)
    p "Mark of the #{self.class.to_s} is #{((brain.size*5) / teach_matterial.size.to_f).round(2)}"
  end
end

class ExcellentStudent < Student
  def conspect_something(teach_matterial)
    @conspect = teach_matterial
  end

  def teach_matterial
    @brain = @conspect[0..@conspect.size*0.95]
  end
end

class BadStudent < Student
  def conspect_something(teach_matterial)
    @conspect = teach_matterial[0..(teach_matterial.size*0.5)]
  end

  def teach_matterial
    @brain = @conspect[0..@conspect.size*0.5]
  end
end

p 'Set knowlage:'
knowlage = gets
bad_student = BadStudent.new
excellent_student = ExcellentStudent.new
bad_student.learn_subject(knowlage)
excellent_student.learn_subject(knowlage)
