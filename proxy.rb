#!/home/kris/.rvm/wrappers/ruby-2.2.0/ruby

class Student
  attr_accessor :author_info

  def initialize info
    @author_info = info
  end
end

class StudentPR < Student
  def make_little_program
    p 'Welcome to the little program creator'
    sleep 1
    p 'Start working..'
    p 'Huyak..'
    sleep 2
    p 'Ta-da! Little program successfully created!'
    p 'Author Info:'
    p @author_info
  end

  def make_middle_program
    p 'Welcome to the middle program creator'
    sleep 1
    p 'Start working..'
    2.times do
      p 'Huyak..'
      sleep 2
    end
    p 'Ta-da! Middle program successfully created!'
    p 'Author Info:'
    p @author_info
  end

  def make_huge_program
    p 'Welcome to the huge program creator'
    sleep 1
    p 'Start working..'
    3.times do
      p 'Huyak..'
      sleep 2
    end
    p 'Ta-da! Huge program successfully created'
    p 'Author Info:'
    p @author_info
  end
end

class StudentKS < Student
  def make_little_board
    p 'Welcome to the little digital board creator'
    sleep 1
    p 'Start working..'
    sleep(1)
    p 'Huyak..'
    sleep 2
    p 'Ta-da! Little digital board successfully created!'
    p 'Author Info:'
    p @author_info
  end

  def make_middle_board
    p 'Welcome to the middle digital board creator'
    sleep 1
    p 'Start working..'
    sleep(1)
    2.times do
      p 'Huyak..'
      sleep 2
    end
    p 'Ta-da! Middle digital board successfully created!'
    p 'Author Info:'
    p @author_info
  end

  def make_huge_board
    p 'Welcome to the huge digital board creator'
    sleep 1
    p 'Start working..'
    sleep(1)
    3.times do
      p 'Huyak..'
      sleep 2
    end
    p 'Ta-da! Huge digital board successfully created'
    p 'Author Info:'
    p @author_info
  end
end

class College
  def initialize
    @student_ks = StudentKS.new('Typical miserable KS student')
    @student_pr = StudentPR.new('Typical miserable PR student')
  end

  def make_little_program
    @student_pr.make_little_program
  end

  def make_middle_program
    @student_pr.make_middle_program
  end

  def make_huge_program
    @student_pr.make_huge_program
  end

  def make_little_board
    @student_ks.make_little_board
  end

  def make_middle_board
    @student_ks.make_middle_board
  end

  def make_huge_board
    @student_ks.make_huge_board
  end
end

college = College.new

college.make_little_board
p '---------------------------------------------------'
sleep 1
college.make_huge_program
