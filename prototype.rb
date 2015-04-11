#!/home/kris/.rvm/wrappers/ruby-2.2.0/ruby

class Prototype
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

puts 'Enter prototype name:'
object_name = gets

prototype = Prototype.new(object_name)

puts 'Prototype name is:'
puts prototype.name

prototype_clone = prototype.clone

puts 'Prototype clone name is:'
puts prototype_clone.name
