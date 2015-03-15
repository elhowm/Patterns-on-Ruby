#!/home/kris/.rvm/wrappers/ruby-2.2.0/ruby

class Prototype
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

p 'Enter prototype name:'
object_name = gets

prototype = Prototype.new(object_name)

p 'Prototype name is:'
p prototype.name

prototype_clone = prototype.clone

p 'Prototype clone name is:'
p prototype_clone.name
