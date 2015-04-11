#!/home/kris/.rvm/wrappers/ruby-2.2.0/ruby

class Student
  attr_accessor :save, :name, :marks

  def initialize(name, marks = nil)
    @name, @marks = name, marks
  end

  def save_my_ass
    @save = Student.new(@name, @marks)
  end

  def back_into_the_past
    self.name = @save.name
    self.marks = @save.marks
  end
end

puts 'Say your name:'
iam = Student.new(gets.chop)
puts 'Set your marks:'
iam.marks = gets.chop
iam.save_my_ass
puts 'Rewrite your marks:'
iam.marks = gets.chop
puts 'Now your marks:'
puts iam.marks
puts 'You are going into the past..'
sleep 2
iam.back_into_the_past
puts 'Now your marks is:'
puts iam.marks
